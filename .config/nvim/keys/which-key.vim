" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '\'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '\'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
let g:which_key_map['='] = [ '<C-W>='                     , 'balance windows' ]
let g:which_key_map[','] = [ 'Startify'                   , 'start screen' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['S'] = [ ':SSave'                     , 'save session' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'n' : [':set nonumber!'          , 'toggle line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'toggle relative line numbers'],
      \ 's' : [':set spell!'             , 'toggle spellchecking'],
      \ 'v' : [':Vista!!'                , 'toggle tag viewer'],
      \ }

" F is for fold
let g:which_key_map.F = {
    \ 'name': '+fold',
    \ 'O' : [':set foldlevel=20', 'open all'],
    \ 'C' : [':set foldlevel=0', 'close all'],
    \ 'c' : [':foldclose', 'close'],
    \ 'o' : [':foldopen', 'open'],
    \ '1' : [':set foldlevel=1', 'level1'],
    \ '2' : [':set foldlevel=2', 'level2'],
    \ '3' : [':set foldlevel=3', 'level3'],
    \ '4' : [':set foldlevel=4', 'level4'],
    \ '5' : [':set foldlevel=5', 'level5'],
    \ '6' : [':set foldlevel=6', 'level6']
    \ }

" f is for find and replace
let g:which_key_map.f = {
      \ 'name' : '+find_replace' ,
      \ 'f' : [':Farr --source=vimgrep'    , 'file'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ':' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ }

" l is for language server protocol
"      \ 'd' : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
"      \ 'D' : [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
"      \ 'q' : [':Telescope quickfix'                 , 'quickfix'],
"      \ 's' : [':Telescope lsp_document_symbols'     , 'document symbols'],
"      \ 'S' : [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'a' : [':Lspsaga code_action'                        , 'quickfix']            ,
      \ 'A' : [':Lspsaga range_code_action'                  , 'selected action']     ,
      \ 'd' : [':execute "lua vim.lsp.buf.definition()"'     , 'goto definition']     ,
      \ 'D' : [':execute "lua vim.lsp.buf.declaration()"'    , 'goto declaration']    ,
      \ 'f' : [':LspFormatting'                              , 'format']              ,
      \ 'H' : [':Lspsaga signature_help'                     , 'signature_help']      ,
      \ 'i' : [':execute "lua vim.lsp.buf.implementation()"' , 'goto implementation'] ,
      \ 'I' : [':LspInfo'                                    , 'lsp_info']            ,
      \ 'l' : [':Lspsaga lsp_finder'                         , 'lsp_finder']          ,
      \ 'L' : [':Lspsaga show_line_diagnostics'              , 'line_diagnostics']    ,
      \ 'o' : [':Vista!!'                                    , 'outline']             ,
      \ 'p' : [':Lspsaga preview_definition'                 , 'preview definition']  ,
      \ 'r' : [':execute "lua vim.lsp.buf.references()"'     , 'find references']     ,
      \ 'R' : [':LspRename'                                  , 'rename']              ,
      \ 'T' : [':LspTypeDefinition'                          , 'type defintion']      ,
      \ 'x' : [':cclose'                                     , 'close quickfix']      ,
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }

" Register which key map
call which_key#register('\', "g:which_key_map")
