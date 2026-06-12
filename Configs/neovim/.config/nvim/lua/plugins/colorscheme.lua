return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      term_colors = true,
      lsp_styles = {
        inlay_hints = { background = false },
      },
      auto_integrations = true,
      color_overrides = {
        mocha = {
          mauve = "#f38ba8",
          pink = "#eba0ac",
        },
      },
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = colors.none },
        }
      end,
    },
  },
}
