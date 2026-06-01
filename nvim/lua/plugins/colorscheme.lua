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
      no_italic = true,
      no_bold = true,
      lsp_styles = {
        inlay_hints = {
          background = false,
        },
      },
      auto_integrations = true,
      integrations = {
        snacks = {
          enabled = true,
        },
        which_key = true,
      },
      color_overrides = {
        latte = {
          pink = '#e64553',
          base = '#ffffff',
          mauve = '#d20f39',
          surface1 = '#e6e9ef',
        },
        mocha = {
          pink = '#eba0ac',
          base = '#141414',
          mauve = '#fab387',
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
