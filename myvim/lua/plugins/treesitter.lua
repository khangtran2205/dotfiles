return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'
      ts.setup {
        install_dir = vim.fn.stdpath 'data' .. '/site',
      }

      local languages = {
        'lua',
        'vimdoc',
        'markdown',
        'python',
        'javascript',
        'typescript',
        'go',
        'rust',
        'dockerfile',
        'css',
        'json',
        'markdown',
        'markdown_inline',
        'sql',
        'terraform',
        'yaml',
        'tsx',
      }
      vim.schedule(function() ts.install(languages) end)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
        desc = 'Start tree-sitter',
      })
    end,
  },
}
