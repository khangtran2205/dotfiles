return {
  'nvim-mini/mini.completion',
  dependencies = {
    { 'nvim-mini/mini.icons', config = function() require('mini.icons').setup() end },
  },
  version = false,
  lazy = false,
  config = function()
    -- Customize post-processing of LSP responses for a better user experience.
    -- Don't show 'Text' suggestions (usually noisy) and show snippets last.
    local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
    local process_items = function(items, base) return require('mini.completion').default_process_items(items, base, process_items_opts) end
    require('mini.completion').setup {
      lsp_completion = {
        source_func = 'omnifunc',
        process_items = process_items,
      },
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args) vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp' end,
    })
  end,
}
