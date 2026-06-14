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
        latte = {
          pink = "#e64553",
          mauve = "#d20f39",
          base = "#ffffff",
          surface1 = "#e6e9ef",
        },
      },
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = colors.none },
          BlinkCmpMenuBorder = { bg = colors.none, fg = colors.none },
          BlinkCmpScrollBarThumb = { bg = colors.none, fg = colors.none },
          BlinkCmpScrollBarGutter = { bg = colors.none, fg = colors.none },
        }
      end,
    },
  },
}
