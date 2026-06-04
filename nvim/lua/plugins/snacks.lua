return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
      icons = {
        tree = {
          vertical = ' ',
          middle = '  ',
          last = '  ',
        },
      },
    },
    terminal = {
      win = {
        position = 'float',
        width = 0.8,
        height = 0.8,
        border = 'rounded',
      },
    },
  },
}
