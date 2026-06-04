return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      term_colors = true,
      lsp_style = {
        inlay_hints = { background = false },
      },
      auto_integrations = true,
      color_overrides = {
        mocha = {
          base = '#141414',
          pink = '#eba0ac',
          mauve = '#f38ba8',
        },
        latte = {
          base = '#ffffff',
          pink = '#e64553',
          mauve = '#d20f39',
          surface1 = '#e6e9ef',
        },
      },
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = colors.none },
          BlinkCmpMenuBorder = { bg = colors.none, fg = colors.none },
        }
      end,
    },
  },
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'catppuccin-nvim',
    },
  },
}
