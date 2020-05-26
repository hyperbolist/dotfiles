if !exists("g:syntax_on")
  syntax enable           " Enables syntax highliting
endif
set hidden                " Required to keep multiple buffers open multiple buffers
set wrap                  " Wrap long lines
set wrapmargin=8          " Wrap lines when coming within n characters from side
set linebreak             " Set soft wrapping
set showbreak=…           " Show ellipsis at breaking
set encoding=utf-8        " The encoding displayed
set pumheight=10          " Makes popup menu smaller
set fileencoding=utf-8    " The encoding written to file
set ruler                 " Show the cursor position all the time
set cmdheight=1           " Don't need more space for displaying messages
set iskeyword+=-          " Treat dash separated words as a word text object
set splitbelow            " Horizontal splits will automatically be below
set splitright            " Vertical splits will automatically be to the right
set t_Co=256              " Support 256 colors
set conceallevel=0        " So that I can see `` in markdown files
set tabstop=2             " Insert 2 spaces for a tab
set softtabstop=2         " Insert 2 spaces for a tab
set shiftwidth=2          " Change the number of space characters inserted for indentation
set smarttab              " Makes tabbing smarter will realize you have 2 vs 4
set expandtab             " Converts tabs to spaces
set smartindent           " Makes indenting smart
set autoindent            " Good auto indent
set laststatus=0          " Never display the status line (unless we're using airline that is)
set nonumber              " Don't show Line numbers
set cursorline            " Enable highlighting of the current line
set background=dark       " Tell vim what the background color looks like
set showtabline=0         " Never show tab line (outside of airline, that is)
set nobackup              " This is recommended by coc
set nowritebackup         " This is recommended by coc
set updatetime=250        " Faster completion
set timeoutlen=250        " By default timeoutlen is 1000 ms
set formatoptions-=cro    " Stop newline continution of comments
set clipboard=unnamedplus " Copy paste between vim and everything else
set shortmess=atTF        " shorten/suppress the messages shown in the command area
set ignorecase            " Case insensitive searching
set smartcase             " Case-sensitive if expresson contains a capital letter
set scrolloff=7           " Lines of text around cursor
set signcolumn=yes        " For git status, etc
set magic                 " Set magic on, for regex
set showmatch             " Show matching braces
set mat=2                 " How many tenths of a second to blink matches
set shell=bash            " Let vim use bash for maximum compatibility, fish breaks noninteractive flows
set inccommand=split      " Show live previews of substitutions

" https://xkcd.com/149/
cmap w!! w !sudo tee %

" ignore junk
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
