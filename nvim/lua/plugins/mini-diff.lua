return {
  'nvim-mini/mini.diff',
  version = false,
  keys = {
    {
      '<leader>go',
      function() require('mini.diff').toggle_overlay() end,
      desc = 'Toggle git diff overlay',
    },
  },
  config = function()
    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = {
          add = '+',
          change = '~',
          delete = '-',
        },
      },
      options = {
        wrap_goto = true,
      },
    }
  end,
}
