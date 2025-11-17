# Utils - Language Support Detection

This directory contains utility functions for detecting language support configured during Docker build.

## How It Works

### 1. Docker Build Creates Marker File

When building the Docker image, a configuration file is created at `~/.config/nvim/.language-support`:

```bash
# Example content:
# Language Support Configuration
PYTHON=true
NODEJS=true
GO=false
RUST=false
PHP=false
LUA=true
RSYNC=false
```

### 2. Neovim Reads Configuration

The `language-support.lua` utility reads this file and provides functions to check which languages are available.

### 3. Plugins Use Detection

Plugins like `mason-tool-installer` and `rsync` use this utility to conditionally load tools and features.

## Usage

### Basic Usage

```lua
local lang_support = require("utils.language-support")

-- Check if a language is supported
if lang_support.is_supported("python") then
  -- Install Python-related tools
end

-- Check if rsync is available
if lang_support.has_rsync() then
  -- Enable rsync features
end

-- Get all supported languages
local languages = lang_support.get_supported_languages()
-- Returns: { "python", "nodejs", "lua", ... }
```

### In Plugin Configuration

```lua
return {
  {
    "some-plugin",
    opts = function()
      local lang_support = require("utils.language-support")

      local config = {}

      if lang_support.is_supported("python") then
        config.python_lsp = "pyright"
      end

      if lang_support.is_supported("go") then
        config.go_lsp = "gopls"
      end

      return config
    end,
  },
}
```

## API Reference

### `read_config()`

Reads and caches the language support configuration.

**Returns:** Table with language support flags

```lua
{
  python = true,
  nodejs = true,
  go = false,
  rust = false,
  php = false,
  lua = true,
  rsync = false,
}
```

### `is_supported(language)`

Check if a specific language is supported.

**Parameters:**

- `language` (string): Language name (case-insensitive)

**Returns:** boolean

**Example:**

```lua
if lang_support.is_supported("python") then
  print("Python is available")
end
```

### `get_supported_languages()`

Get a list of all supported languages.

**Returns:** Array of language names

**Example:**

```lua
local langs = lang_support.get_supported_languages()
-- { "python", "nodejs", "lua" }
```

### `has_rsync()`

Check if rsync is available (both installed and executable).

**Returns:** boolean

**Example:**

```lua
if lang_support.has_rsync() then
  -- Enable rsync plugin
end
```

## Backward Compatibility

The utility checks for the language support file in the following order:

1. `~/.config/nvim/.language-support`
2. `~/.language-support`
3. If neither exists, all languages are assumed to be not available

This ensures existing configurations continue to work seamlessly.

## Examples

### Mason Tool Installer

See `../plugins/mason-tool-installer.lua` for a complete example of dynamic tool installation based on language support.

### Rsync Plugin

See `../plugins/rsync.lua` for conditional plugin loading based on rsync availability.
