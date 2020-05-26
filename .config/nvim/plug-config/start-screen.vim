let g:startify_custom_header = [
        \ '     _  _       __   ___        ',
        \ '    | \| |___ __\ \ / (_)_ __   ',
        \ '    | .` / -_) _ \ V /| | `  \  ',
        \ '    |_|\_\___\___/\_/ |_|_|_|_| ',
        \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent']                        },
          \ { 'type': 'dir',       'header': ['   Project '. getcwd()]            },
          \ { 'type': 'sessions',  'header': ['   Sessions']                      },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                     },
          \ ]

" sessions
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1

" makes the 'dir' type track the current project
let g:startify_change_to_vcs_root = 1

" hide empty/quit
let g:startify_enable_special = 0

" invoke explicitly, not on vim start
let g:startify_disable_at_vimenter = 1
