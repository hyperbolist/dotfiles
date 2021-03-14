" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  Plug '/usr/local/opt/fzf'               " FZF binary
  Plug 'Quramy/vim-js-pretty-template'    " Colorizes JS template strings
  Plug 'brooth/far.vim'                   " Find and Replace
  Plug 'airblade/vim-gitgutter'           " git diff in sign column
  Plug 'airblade/vim-rooter'              " cd to the project root (.git) for the given buffer context
  Plug 'chriskempson/base16-vim'          " Colorscheme
  Plug 'godlygeek/tabular'                " Text Alignment
  Plug 'glepnir/lspsaga.nvim'             " pretty lsp windows
  Plug 'hrsh7th/nvim-compe', {'commit': '2517075' } " neovim native completion
  Plug 'jiangmiao/auto-pairs'             " auto pairs for '(' '[' '{'
  Plug 'jeetsukumaran/vim-filebeagle'     " Bare-minimum file picker
  Plug 'junegunn/fzf.vim'                 " FZF plugin
  Plug 'junegunn/goyo.vim'                " Prose mode plugin
  Plug 'junegunn/limelight.vim'           " Prose mode enhancement, darkens other paragraphs
  Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Parens
  Plug 'liuchengxu/vim-which-key'         " Flexible <leader> mapping
  Plug 'liuchengxu/vista.vim'             " Tag browser
  Plug 'mhinz/vim-startify'               " Sessions
  Plug 'neovim/nvim-lspconfig'            " neovim native lsp configuration
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " better syntax highlighting
  Plug 'numkil/ag.nvim'                   " Ag classic, results in the quickfix window
  Plug 'preservim/nerdcommenter'          " Flexible (Un)Commenting
  Plug 'ray-x/lsp_signature.nvim'         " lsp signature help
  Plug 'sgur/vim-editorconfig'            " Honor .editorconfig
  Plug 'sheerun/vim-polyglot'             " Modernized Syntax Support
  Plug 'tpope/vim-commentary'             " Easy (Un)Commenting
  Plug 'tpope/vim-endwise'                " Automagically insert 'end'
  Plug 'tpope/vim-fugitive'               " Git commands, exposes git to other plugins
  Plug 'tpope/vim-repeat'                 " Allows . to work for more operations (mostly Tim's other plugins)
  Plug 'tpope/vim-surround'               " Easy (Un)Surround
  Plug 'tpope/vim-unimpaired'             " Extremely convenient prev/next mappings
  Plug 'unblevable/quick-scope'           " ftFT helper
  Plug 'vim-airline/vim-airline'          " Status line
  Plug 'vim-airline/vim-airline-themes'   " Status line themes
  Plug 'voldikss/vim-floaterm'            " Floating Terminal, for momentary tools

call plug#end()
