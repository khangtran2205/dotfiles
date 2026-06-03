local map = vim.keymap.set

map('i', 'jj', '<Esc>', { noremap = false })

map('n', '<C-a>', 'ggVG', { desc = 'Select all', noremap = false })
map('n', 'ya', '<cmd>%y+<cr>', { desc = 'Select & yank all' })
map('n', 'qq', '<cmd>close<cr>', { desc = 'Close current window', silent = true })
