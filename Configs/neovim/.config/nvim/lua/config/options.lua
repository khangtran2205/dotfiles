-- Global options
vim.g.mapleader = ' '
vim.g.localmapleader = ' '
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0

-- Preferences
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.smoothscroll = true
vim.opt.conceallevel = 0
vim.opt.pumborder = 'rounded'
vim.opt.winborder = 'rounded'

-- Indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.wrap = false
vim.opt.linebreak = true

-- Backup & undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- Hlsearch
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'cursor'

vim.opt.shortmess:append { W = true, I = true, c = true, C = true }
vim.opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus'

-- Folding
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""

vim.opt.inccommand = "nosplit"
vim.opt.completeopt = "menu,menuone,noinsert,popup"
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
