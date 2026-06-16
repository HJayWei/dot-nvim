return {
  {
    "catppuccin/nvim",
    -- "EdenEast/nightfox.nvim",
    -- "rebelot/kanagawa.nvim",
    -- "AlexvZyl/nordic.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("nordic").load()
    -- end,
    opts = {
      -- transparent_background = true,
      color_overrides = {
        frappe = {

          base = "#242933",
          mantle = "#1E222B",
          crust = "#191D24",
          surface0 = "#2E3440",
          surface1 = "#3B4252",
          surface2 = "#434C5E",

          overlay0 = "#4C566A",
          overlay1 = "#616E88",
          overlay2 = "#7E8AA3",

          text = "#C0C8D8",
          subtext0 = "#A5AEC4",
          subtext1 = "#D8DEE9",

          red = "#BF616A",
          maroon = "#C5727A",
          peach = "#D08770",
          yellow = "#EBCB8B",
          green = "#A3BE8C",
          teal = "#9FC6C5",
          sky = "#88C0D0",
          sapphire = "#5E81AC",
          blue = "#81A1C1",
          lavender = "#B48EAD",
          mauve = "#BE9DB8",
          pink = "#D8A0B2",
          flamingo = "#D57780",
          rosewater = "#E5C1C5",
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
      -- colorscheme = "nordfox",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "nordic",
    },
  },
}
