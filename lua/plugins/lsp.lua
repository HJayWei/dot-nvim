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

            if type(fname) == "number" then
              fname = vim.api.nvim_buf_get_name(fname)
            elseif fname == nil or fname == "" then
              fname = vim.api.nvim_buf_get_name(0)
            end

            if fname == nil or fname == "" then
              fname = vim.loop.cwd()
            end

            local root = util.root_pattern(
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
            )(fname)

            return root or util.find_git_ancestor(fname)
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
