return {
  'nvim-mini/mini.pick',
  dependencies = {
    { 'nvim-mini/mini.icons' },
    { 'nvim-mini/mini.extra' },
  },
  version = false,
  lazy = 'VeryLazy',
  keys = {
    {
      '<leader>fe',
      function() require('mini.extra').pickers.explorer() end,
      desc = 'Open read-only file explorer',
    },
    {
      '<leader>ff',
      function() require('mini.pick').builtin.files() end,
      desc = 'Open file picker',
    },
    {
      '<leader>fg',
      function() require('mini.pick').builtin.grep_live() end,
      desc = 'Open live grep',
    },
    {
      '<leader>fb',
      function() require('mini.pick').builtin.buffers() end,
      desc = 'Open buffer picker',
    },
    {
      '<leader>dg',
      function()
        require('mini.extra').pickers.diagnostic {
          scope = 'current',
          sort_by = 'severity',
        }
      end,
      desc = 'Open buffer diagnostic',
    },
    {
      '<leader>dG',
      function()
        require('mini.extra').pickers.diagnostic {
          scope = 'all',
          sort_by = 'severity',
        }
      end,
      desc = 'Open global diagnostic',
    },
  },
  config = function()
    local pick = require 'mini.pick'
    local extra = require 'mini.extra'
    pick.setup {
      window = {
        config = function()
          local height = math.floor(0.618 * vim.o.lines)
          local width = math.floor(0.618 * vim.o.columns)
          return {
            anchor = 'NW',
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
          }
        end,
      },
    }

    extra.setup()
  end,
}
