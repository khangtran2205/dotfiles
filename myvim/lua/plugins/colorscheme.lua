return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
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
      integrations = {
        mini = { enabled = true, indentscope_color = 'red' },
        mason = true,
      },
      color_overrides = {
        latte = {
          pink = '#e64553',
          base = '#ffffff',
          mauve = '#d20f39',
        },
        mocha = {
          pink = '#eba0ac',
          base = '#141414',
          mauve = '#ed8796',
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin-nvim'
  end,
}
