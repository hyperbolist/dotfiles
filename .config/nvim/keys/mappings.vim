" Set leader key (backslash is default, so this might not be necessary)
let mapleader = '\'
nnoremap '\' <Nop>

" Better nav for omnicomplete
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" TAB in general mode will move to text buffer
nnoremap <silent><TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent><S-TAB> :bprevious<CR>

" SPACE to clear the highlight on search hits
nnoremap <silent><SPACE> :noh<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close buffer with option-w
nnoremap <silent><M-w> :bd<CR>

" Tag browsing (enter: goto tag, backspace: up tag tree)
au filetype,BufRead help :nnoremap <buffer><cr> <c-]>
au filetype,BufRead help :nnoremap <buffer><bs> <c-T>
