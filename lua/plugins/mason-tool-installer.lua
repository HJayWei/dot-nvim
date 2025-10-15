return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function()
      -- Load language support detection utility
      local lang_support = require("utils.language-support")

      -- Build ensure_installed list based on available languages
      local ensure_installed = {}

      -- Always install common tools
      local common_tools = {
        "bash-language-server",
        "json-lsp",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "shellcheck",
        "shfmt",
      }
      vim.list_extend(ensure_installed, common_tools)

      -- PHP packages
      if lang_support.is_supported("php") then
        vim.list_extend(ensure_installed, {
          "intelephense",
          "php-debug-adapter",
          "pint",
        })
      end

      -- Rust packages
      if lang_support.is_supported("rust") then
        vim.list_extend(ensure_installed, {
          "codelldb",
          "rust-analyzer",
        })
      end

      -- JavaScript/Node.js packages (including Vue)
      if lang_support.is_supported("nodejs") then
        vim.list_extend(ensure_installed, {
          "js-debug-adapter",
          "prettier",
          "vtsls",
          "vue-language-server", -- Vue
        })
      end

      -- Go packages
      if lang_support.is_supported("go") then
        vim.list_extend(ensure_installed, {
          "goimports",
          "gofumpt",
          "golangci-lint",
          "delve",
          "gopls",
          "go-debug-adapter",
        })
      end

      -- Lua packages
      if lang_support.is_supported("lua") then
        vim.list_extend(ensure_installed, {
          "lua-language-server",
          "stylua",
        })
      end

      return {
        ensure_installed = ensure_installed,
        run_on_start = true,
        auto_update = false,
      }
    end,
  },
}
