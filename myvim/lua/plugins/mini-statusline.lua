return {
  'nvim-mini/mini.statusline',
  version = false,
  dependencies = {
    { 'nvim-mini/mini-git' },
    { 'nvim-mini/mini.diff' },
    { 'nvim-mini/mini.icons' },
  },
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup {
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
          local git = statusline.section_git { trunc_width = 40, icon = '' }
          local diff = statusline.section_diff { trunc_width = 75 }
          local diagnostics = statusline.section_diagnostics { trunc_width = 75, signs = { ERROR = ' ', WARN = ' ', INFO = ' ', HINT = '󰌵 ' } }
          local filename = statusline.section_filename { trunc_width = 140 }
          local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
          local location = statusline.section_location { trunc_width = 75 }
          local search = statusline.section_searchcount { trunc_width = 75 }

          diff = diff:gsub('%+', ' ')
          diff = diff:gsub('~', ' ')
          diff = diff:gsub('%-', ' ')

          return statusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineGit', strings = { git } },
            { hl = 'MiniStatuslineDiff', strings = { diff } },
            '%<',
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineFileinfo', strings = { diagnostics, fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          }
        end,
      },
    }
    vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'MiniStatuslineGit', { fg = '#c4b5fd', bg = '#444760', bold = true })
    vim.api.nvim_set_hl(0, 'MiniStatuslineDiff', { fg = '#cdd6f4', bg = '#444760', bold = true })
  end,
}
