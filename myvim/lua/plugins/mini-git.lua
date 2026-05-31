return {
  'nvim-mini/mini-git',
  version = false,
  keys = {
    {
      '<leader>gb',
      function()
        local file = vim.api.nvim_buf_get_name(0)
        local root = vim.fs.root(file, '.git')
        local rel_file = vim.fs.relpath(root, file)
        vim.cmd('vertical Git blame -s --abbrev=8 -- ' .. vim.fn.fnameescape(rel_file))
      end,
      desc = 'Git blame file',
    },
    {
      '<leader>gB',
      function() require('mini.git').show_at_cursor() end,
      mode = { 'n', 'x' },
      desc = 'Git history at cursor',
    },
    {
      '<leader>gl',
      function() vim.cmd 'vertical Git log --oneline --decorate --graph --all' end,
      desc = 'Git log full history',
    },
  },
  config = function()
    require('mini.git').setup {}

    -- Use only HEAD name as summary string
    local format_summary = function(data)
      -- Utilize buffer-local table summary
      local summary = vim.b[data.buf].minigit_summary
      vim.b[data.buf].minigit_summary_string = summary.head_name or ''
    end

    local au_opts = { pattern = 'MiniGitUpdated', callback = format_summary }
    vim.api.nvim_create_autocmd('User', au_opts)

    -- Make `:vertical Git blame -- %` scroll together with source window
    local align_blame = function(au_data)
      if au_data.data.git_subcommand ~= 'blame' then return end

      local win_src = au_data.data.win_source
      vim.wo.wrap = false
      vim.fn.winrestview {
        topline = vim.fn.line('w0', win_src),
      }

      vim.api.nvim_win_set_cursor(0, {
        vim.fn.line('.', win_src),
        0,
      })
      vim.wo[win_src].scrollbind = true
      vim.wo.scrollbind = true
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniGitCommandSplit',
      callback = align_blame,
    })
  end,
}
