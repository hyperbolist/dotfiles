" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  Plug '/usr/local/opt/fzf'               " FZF binary
  Plug 'OmniSharp/omnisharp-vim'          " OmniSharp
  Plug 'Quramy/vim-js-pretty-template'    " Colorizes JS template strings
  Plug 'Shougo/echodoc.vim'               " Provides additional feedback options for CoC operations
  Plug 'airblade/vim-rooter'              " cd to the project root (.git) for the given buffer context
  Plug 'chriskempson/base16-vim'          " Colorscheme
  Plug 'godlygeek/tabular'                " Text Alignment
  Plug 'jeetsukumaran/vim-filebeagle'     " Bare-minimum file picker
  Plug 'junegunn/fzf.vim'                 " FZF plugin
  Plug 'junegunn/goyo.vim'                " Prose mode plugin
  Plug 'junegunn/limelight.vim'           " Prose mode enhancement, darkens other paragraphs
  Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Parens
  Plug 'liuchengxu/vim-which-key'         " Flexible <leader> mapping
  Plug 'liuchengxu/vista.vim'             " Tag browser
  Plug 'mhinz/vim-startify'               " Sessions
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense and more, can't really live without it now
  Plug 'numkil/ag.nvim'                   " Ag classic, results in the quickfix window
  Plug 'preservim/nerdcommenter'          " Flexible (Un)Commenting
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

" list coc extensions explicitly here, since they're kind of like plugins
let g:coc_global_extensions = [
  \ 'coc-cfn-lint',
  \ 'coc-docker',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-omnisharp',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-tslint',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]
