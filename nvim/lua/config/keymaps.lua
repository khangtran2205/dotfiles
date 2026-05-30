local map = vim.keymap.set

-- Escape insert with jj
map('i', 'jj', '<Esc>', { noremap = false })

-- Save & quit
map({ 'n', 'i', 'v' }, '<C-s>', '<Esc><cmd>w<cr>', { desc = 'Save file' })
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- Restart
map('n', 'rs', '<cmd>restart<cr>', { desc = 'Restart neovim' })

-- Select all
map('n', '<C-a>', 'ggVG', { desc = 'Select all' })
map('n', 'ya', ':%y+<cr>', { desc = 'Select & copy all', silent = true })

-- Split window
map('n', '<leader>-', '<cmd>split<cr>', { desc = 'Horizontal split', silent = true })
map('n', '<leader>|', '<cmd>vsplit<cr>', { desc = 'Vertical split', silent = true })
map('n', 'qq', '<cmd>close<cr>', { desc = 'Close window', silent = true })

-- Move between window
map('n', '<C-h>', '<C-w>h', { desc = 'Go left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go right window' })
