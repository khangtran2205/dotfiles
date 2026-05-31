local map = vim.keymap.set

map('n', '<C-a>', 'ggVG', { desc = 'Select all', noremap = false })
map('n', 'ya', '<cmd>%y+<cr>', { desc = 'Select & yank all' })
map('n', 'qq', '<cmd>close<cr>', { desc = 'Close current window', silent = true })
