return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  lazy = false,
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>cf',
      function() require('conform').format { formatters = { 'injected' }, timeout_ms = 3000 } end,
      mode = { 'n', 'x' },
      desc = 'Format',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format' },
      go = { 'gofumpt', 'goimports' },
      javascript = { 'oxfmt', stop_after_first = true },
      typescript = { 'oxfmt', stop_after_first = true },
      markdown = { 'oxfmt', 'markdownlint-cli2', 'markdown-toc' },
      ['markdown.mdx'] = { 'oxfmt', 'markdownlint-cli2', 'markdown-toc' },
      ['*'] = { 'trim_whitespace' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
    formatters = {
      injected = {
        options = { ignore_errors = true },
      },
      ['markdown-toc'] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find '<!%-%- toc %-%->' then return true end
          end
        end,
      },
      ['markdownlint-cli2'] = {
        condition = function(_, ctx)
          local diag = vim.tbl_filter(function(d) return d.source == 'markdownlint' end, vim.diagnostic.get(ctx.buf))
          return #diag > 0
        end,
      },
    },
  },
}
