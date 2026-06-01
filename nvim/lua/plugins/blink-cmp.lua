return {
  'saghen/blink.cmp',
  opts = {
    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
  },
}
