return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft or {}, {
        php = { "pint" },
      })
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          root_markers = { "composer.json", ".git" },
          settings = {
            intelephense = {
              format = { enable = false },
            },
          },
        },
        eslint = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              "eslint.config.js",
              "eslint.config.cjs",
              "eslint.config.mjs",
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.json",
              ".eslintrc.yml",
              ".eslintrc.yaml",
              "package.json"
            )(fname) or util.find_git_ancestor(fname)
          end,

          settings = {
            eslint = {
              experimental = {
                useFlatConfig = false,
              },
              workingDirectory = {
                mode = "location",
              },
            },
          },
        },
      },
    },
  },
}
