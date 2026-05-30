return {
  {
    'nvim-mini/mini.starter',
    version = false,
    config = function()
      local pick = require 'mini.pick'
      local extra = require 'mini.extra'

      local function full_screen_picker()
        return {
          relative = 'editor',
          anchor = 'NW',
          row = 0,
          col = 0,
          width = vim.o.columns,
          height = vim.o.lines - vim.o.cmdheight,
          border = 'rounded',
        }
      end

      pick.setup {
        window = {
          config = full_screen_picker,
          prompt_prefix = '  ',
        },
      }

      extra.setup()

      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          -- Only open explorer when running plain `nvim`
          -- Do not open when running `nvim file.txt`
          if vim.fn.argc() > 0 then return end

          vim.schedule(
            function()
              extra.pickers.explorer(nil, {
                window = {
                  config = full_screen_picker,
                },
              })
            end
          )
        end,
      })
    end,
  },
}
