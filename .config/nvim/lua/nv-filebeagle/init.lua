vim.g.filebeagle_suppress_keymaps = 1
vim.api.nvim_set_keymap('n', '-', ':FileBeagleBufferDir<CR>', { noremap = true, silent = true })
