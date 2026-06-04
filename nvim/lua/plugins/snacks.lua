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
        width = 0.9,
        height = 0.9,
        border = 'rounded',
      },
    },
    indent = {
      enabled = false,
    },
  },
}
