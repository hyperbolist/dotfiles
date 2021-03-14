"                _   __         _    ___
"               / | / /__  ____| |  / (_)___ ___
"              /  |/ / _ \/ __ \ | / / / __ `__ \
"             / /|  /  __/ /_/ / |/ / / / / / / /
"            /_/ |_/\___/\____/|___/_/_/ /_/ /_/
"
" config adapted from https://github.com/ChristianChiarulli/nvim
"

source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/autocommands.vim
source $HOME/.config/nvim/general/types.vim

source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

source $HOME/.config/nvim/themes/tomorrow-night.vim
source $HOME/.config/nvim/themes/airline.vim

luafile $HOME/.config/nvim/plug-config/compe.lua
source $HOME/.config/nvim/plug-config/endwise.vim
source $HOME/.config/nvim/plug-config/filebeagle.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/fzf.vim
luafile $HOME/.config/nvim/plug-config/gitsigns.lua
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/limelight.vim
luafile $HOME/.config/nvim/plug-config/lspconfig.lua
source $HOME/.config/nvim/plug-config/lspconfig.vim
source $HOME/.config/nvim/plug-config/nerd-commenter.vim
luafile $HOME/.config/nvim/plug-config/nvim-treesitter.lua
source $HOME/.config/nvim/plug-config/polyglot.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/rainbow_parentheses.vim
source $HOME/.config/nvim/plug-config/rooter.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vista.vim

luafile $HOME/.config/nvim/lsp/golang-ls.lua
