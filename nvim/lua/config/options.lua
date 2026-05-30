vim.g.mapleader = ' '
vim.g.localmapleader = ' '
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.completeopt = 'menu,menuone,noinsert,popup'
vim.o.fillchars = 'eob: ,fold:╌'
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

--Lsp inlay hints
vim.lsp.inlay_hint.enable(true)

-- Tweaks
vim.opt.shortmess:append { W = true, I = true, c = true, C = true }
vim.opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus'
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.mouse = 'a'
vim.opt.laststatus = 3
vim.opt.conceallevel = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'screen'
vim.opt.wrap = false

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.pumborder = 'rounded'
vim.opt.pummaxwidth = 100
vim.opt.pumheight = 10
vim.opt.termguicolors = true
vim.opt.smoothscroll = true
vim.opt.cursorline = false
vim.opt.winborder = 'rounded'

-- HL search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs & indents
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd 'filetype plugin indent on'
if vim.fn.exists 'syntax_on' ~= 1 then vim.cmd 'syntax enable' end
