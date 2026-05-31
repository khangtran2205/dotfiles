return {
  'nvim-mini/mini.files',
  dependencies = {
    {
      'nvim-mini/mini.icons',
      config = function() require('mini.icons').setup() end,
      init = function() require('mini.icons').mock_nvim_web_devicons() end,
    },
  },
  version = false,
  keys = {
    {
      '<leader>e',
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local dir_name = vim.fn.fnamemodify(buf_name, ':p:h')
        if vim.fn.filereadable(buf_name) == 1 then
          require('mini.files').open(buf_name, true)
        elseif vim.fn.isdirectory(dir_name) == 1 then
          require('mini.files').open(dir_name, true)
        else
          require('mini.files').open(vim.uv.cwd(), true)
        end
      end,
      desc = 'Open mini.files',
    },
    {
      '<leader>E',
      function() require('mini.files').open(vim.uv.cwd(), true) end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function()
    local mini_files = require 'mini.files'

    mini_files.setup {
      mappings = {
        close = '<Esc>',
        go_in_plus = '<CR>',
        go_out = '-',
      },
      windows = {
        preview = true,
        width_focus = 50,
        width_nofocus = 30,
        width_preview = 70,
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    }

    local function create_file()
      local entry = mini_files.get_fs_entry()
      if not entry then return end

      local dir = entry.fs_type == 'directory' and entry.path or vim.fs.dirname(entry.path)

      vim.ui.input({ prompt = 'New file: ' }, function(name)
        if not name or name == '' then return end
        local path = dir .. '/' .. name
        if name:sub(-1) == '/' then
          vim.fn.mkdir(path, 'p')
        else
          vim.fn.mkdir(vim.fs.dirname(path), 'p')
          vim.fn.writefile({}, path)
        end
        mini_files.synchronize()
      end)
    end

    local function delete_file()
      local entry = mini_files.get_fs_entry()
      if not entry then return end
      if entry.fs_type == 'directory' then
        vim.fn.delete(entry.path, 'rf')
      else
        vim.fn.delete(entry.path)
      end
      mini_files.synchronize()
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', 'N', create_file, {
          buffer = args.data.buf_id,
        })
        vim.keymap.set('n', 'D', delete_file, {
          buffer = args.data.buf_id,
        })
      end,
    })
  end,
}
