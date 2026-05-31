local function augroup(name) return vim.api.nvim_create_augroup('user_' .. name, { clear = true }) end

local _checktime_timer = nil
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup 'checktime',
  callback = function()
    if _checktime_timer then
      _checktime_timer:stop()
      _checktime_timer:close()
      _checktime_timer = nil
    end
    _checktime_timer = vim.defer_fn(function()
      _checktime_timer = nil
      if vim.o.buftype ~= 'nofile' then vim.cmd 'checktime' end
    end, 200)
  end,
})

local _resize_timer = nil
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup 'resize_splits',
  callback = function()
    if _resize_timer then
      _resize_timer:stop()
      _resize_timer:close()
      _resize_timer = nil
    end
    local current_tab = vim.fn.tabpagenr()
    _resize_timer = vim.defer_fn(function()
      _resize_timer = nil
      vim.cmd 'tabdo wincmd ='
      vim.cmd('tabnext ' .. current_tab)
    end, 100)
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup 'highlight_yank',
  callback = function() (vim.hl or vim.highlight).on_yank() end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup 'last_loc',
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then return end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'iskeyword_kebab',
  pattern = { 'css', 'scss', 'less', 'html', 'htmldjango', 'blade', 'typescriptreact', 'javascriptreact' },
  callback = function() vim.opt_local.iskeyword:append '-' end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'msg',
  callback = function()
    local ui2 = require 'vim._core.ui2'
    local win = ui2.wins and ui2.wins.msg
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_option_value('winhighlight', 'Normal:NormalFloat,FloatBorder:FloatBorder', { scope = 'local', win = win })
    end
  end,
})

local ui2 = require 'vim._core.ui2'
local msgs = require 'vim._core.ui2.messages'
local orig_set_pos = msgs.set_pos
msgs.set_pos = function(tgt)
  orig_set_pos(tgt)
  if (tgt == 'msg' or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
    pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
      relative = 'editor',
      anchor = 'NE',
      row = 1,
      col = vim.o.columns - 1,
      border = 'rounded',
    })
  end
end

vim.api.nvim_create_autocmd('LspProgress', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value
    local msg = ('[%s] %s %s'):format(client.name, value.kind == 'end' and '✓' or '', value.title or '')
    vim.notify(msg)
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client or client.name ~= 'gopls' then return end

    if client.config and client.config.init_options and client.config.init_options.semanticTokens and not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens

      client.server_capabilities.semanticTokensProvider = {
        full = true,
        legend = {
          tokenTypes = semantic.tokenTypes,
          tokenModifiers = semantic.tokenModifiers,
        },
        range = true,
      }
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method 'textDocument/inlayHint' then vim.lsp.inlay_hint.enable(true, { bufnr = args.buf }) end
  end,
})
