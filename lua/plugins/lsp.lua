return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          root_markers = { "composer.json", ".git" },
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
