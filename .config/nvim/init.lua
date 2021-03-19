--                _   __         _    ___
--               / | / /__  ____| |  / (_)___ ___
--              /  |/ / _ \/ __ \ | / / / __ `__ \
--             / /|  /  __/ /_/ / |/ / / / / / / /
--            /_/ |_/\___/\____/|___/_/_/ /_/ /_/
--
-- config adapted from https://github.com/ChristianChiarulli/nvim
--

require('plugins')
require('keymappings')
require('settings')
require('colorscheme')
require('utils')

-- Plugins
--require('nv-airline')
require('nv-barbar')
require('nv-compe')
require('nv-filebeagle')
require('nv-floaterm')
require('nv-galaxyline')
require('nv-gitblame')
require('nv-gitsigns')
require('nv-kommentary')
require('nv-nvim-autopairs')
require('nv-nvimtree')
require('nv-quickscope')
require('nv-rnvimr')
require('nv-startify')
require('nv-telescope')
require('nv-treesitter')
require('nv-vim-rooter')

-- .vim still
vim.cmd('source ~/.config/nvim/vimscript/nv-goyo/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/nv-whichkey/init.vim')

-- LSP
require('lsp')
require('lsp.bash-ls')
require('lsp.docker-ls')
require('lsp.go-ls')
require('lsp.json-ls')
require('lsp.lua-ls')
require('lsp.vim-ls')
require('lsp.yaml-ls')
