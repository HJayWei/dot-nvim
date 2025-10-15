-- Language Support Detection Utility
-- Reads /root/.language-support file created during Docker build

local M = {}

-- Cache for language support status
local language_cache = nil

-- Read language support configuration from file
function M.read_config()
  if language_cache then
    return language_cache
  end

  local config = {
    python = false,
    nodejs = false,
    go = false,
    rust = false,
    php = false,
    lua = false,
    rsync = false,
  }

  -- Try to read from nvim config directory first (new location)
  local config_file = vim.fn.expand("~/.language-support")

  -- Fallback to old location if new location doesn't exist
  if vim.fn.filereadable(config_file) == 0 then
    config_file = vim.fn.stdpath("config") .. "/.language-support"
  end

  -- Check if file exists
  if vim.fn.filereadable(config_file) == 0 then
    -- File doesn't exist, assume all languages are installed (backward compatibility)
    for key, _ in pairs(config) do
      config[key] = true
    end
    language_cache = config
    return config
  end

  -- Read file line by line
  local file = io.open(config_file, "r")
  if not file then
    -- Can't read file, assume all languages installed
    for key, _ in pairs(config) do
      config[key] = true
    end
    language_cache = config
    return config
  end

  for line in file:lines() do
    -- Skip comments and empty lines
    if not line:match("^%s*#") and not line:match("^%s*$") then
      -- Parse KEY=VALUE format
      local key, value = line:match("^([^=]+)=(.+)$")
      if key and value then
        key = key:lower():gsub("^%s*(.-)%s*$", "%1") -- trim and lowercase
        value = value:gsub("^%s*(.-)%s*$", "%1") -- trim

        if config[key] ~= nil then
          config[key] = (value == "true")
        end
      end
    end
  end

  file:close()
  language_cache = config
  return config
end

-- Check if a specific language is supported
function M.is_supported(language)
  local config = M.read_config()
  language = language:lower()
  return config[language] == true
end

-- Get list of supported languages
function M.get_supported_languages()
  local config = M.read_config()
  local supported = {}

  for lang, enabled in pairs(config) do
    if enabled then
      table.insert(supported, lang)
    end
  end

  return supported
end

-- Check if rsync is available
function M.has_rsync()
  return M.is_supported("rsync") and vim.fn.executable("rsync") == 1
end

return M
