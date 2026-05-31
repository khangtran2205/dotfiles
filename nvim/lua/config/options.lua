-- nvim global config
vim.g.mapleader = ' '
vim.g.localmapleader = ' '
vim.g.have_nerd_font = true
vim.g.lazyvim_python_lsp = 'pyrefly'
vim.g.lazyvim_ts_lsp = 'tsgo'

-- enable inlay hints for current buffer
vim.lsp.inlay_hint.enable(true, { bufnr = 0 })

vim.opt.conceallevel = 0
vim.opt.cursorline = false
vim.opt.completeopt = 'menu,menuone,noinsert,popup,fuzzy'
vim.opt.pumborder = 'rounded'
vim.opt.winborder = 'rounded'
vim.opt.showmode = false
vim.opt.cmdheight = 0
