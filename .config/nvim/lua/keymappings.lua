-- leader
vim.api.nvim_set_keymap('n', '\\', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = '\\'

-- Close buffer with option-w
--vim.api.nvim_set_keymap('n', '<M-w>', ':bwipeout<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-w>', ':Bwipeout<CR>', { noremap = true, silent = true })

-- no hl
vim.api.nvim_set_keymap('n', '<SPACE>', ':noh<CR>', { noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv=gv', { noremap = true, silent = true })

-- https://xkcd.com/149/
vim.api.nvim_set_keymap('c', 'w!!', 'w !sudo tee %', { noremap = true, silent = true })
