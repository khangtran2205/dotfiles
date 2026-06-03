return {
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      italics = false,
      compile = true,
      transparent = true,
      background = {
        dark = 'zen',
      },
      minimal = true,
      foreground = 'saturated',
      colors = {
        theme = {
          all = {
            ui = { float = { bg = 'none' }, pmenu = { bg = 'none' } },
          },
        },
      },
      overrides = function(colors)
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
      colorscheme = 'kanso',
    },
  },
}
