local palette = {
  err = '#d20f39',
  warn = '#fe640b',
  info = '#91d7e3',
  hint = '#7dc4e4',
}

vim.api.nvim_set_hl(0, 'DiagnosticErrorLine', { bg = palette.err, blend = 20 })
vim.api.nvim_set_hl(0, 'DiagnosticWarnLine', { bg = palette.warn, blend = 15 })
vim.api.nvim_set_hl(0, 'DiagnosticInfoLine', { bg = palette.info, blend = 10 })
vim.api.nvim_set_hl(0, 'DiagnosticHintLine', { bg = palette.hint, blend = 10 })
vim.api.nvim_set_hl(0, 'DapBreakpointSign', { fg = '#FF0000', bg = nil, bold = true })
vim.fn.sign_define('DapBreakpoint', {
  text = '●', -- a large dot; change as desired
  texthl = 'DapBreakpointSign', -- the highlight group you just defined
  linehl = '', -- no full-line highlight
  numhl = '', -- no number-column highlight
})

local sev = vim.diagnostic.severity

vim.diagnostic.config {
  underline = true,
  severity_sort = true,
  update_in_insert = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  linehl = {
    [sev.ERROR] = 'DiagnosticErrorLine',
  },
}

local diagnostic_goto = function(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function() vim.diagnostic.jump { count = next and 1 or -1, float = true, severity = severity } end
end
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc }) end

    -- Diagnostics navigation
    map('n', '<leader>cd', vim.diagnostic.open_float, 'Line Diagnostics')
    map('n', ']d', diagnostic_goto(true), 'Next Diagnostic')
    map('n', '[d', diagnostic_goto(false), 'Prev Diagnostic')
    map('n', ']e', diagnostic_goto(true, 'ERROR'), 'Next Error')
    map('n', '[e', diagnostic_goto(false, 'ERROR'), 'Prev Error')
    map('n', ']w', diagnostic_goto(true, 'WARN'), 'Next Warning')
    map('n', '[w', diagnostic_goto(false, 'WARN'), 'Prev Warning')

    -- LSP keymap
    map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'gr', vim.lsp.buf.references, 'References')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, 'Format buffer')
  end,
})
