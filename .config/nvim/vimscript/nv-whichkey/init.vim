" Leader Key Maps

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
" let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
" let g:which_key_map['/'] = { 'name' : 'comment' }
" let g:which_key_map['/'] = 'which_key_ignore'
let g:which_key_map[';'] = [ ':Dashboard'                                      , 'home screen' ]
let g:which_key_map['?'] = [ ':NvimTreeFindFile'                               , 'find current file' ]
let g:which_key_map['e'] = [ ':NvimTreeToggle'                                 , 'explorer' ]
let g:which_key_map['f'] = [ ':Telescope find_files'                           , 'find files' ]
" let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['m'] = [ ':MarkdownPreviewToggle'                          , 'markdown preview']
" let g:which_key_map['n'] = [ ':noh'                                            , 'no highlight' ]
let g:which_key_map['n'] = [ ':set nonumber!'                                  , 'line-numbers']
let g:which_key_map['r'] = [ ':RnvimrToggle'                                   , 'ranger' ]
let g:which_key_map['R'] = [ ':set norelativenumber!'                          , 'relative line nums' ]
"let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                 , 'treesitter highlight' ]
" let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]

" Group mappings

" " a is for actions
" let g:which_key_map.a = {
"       \ 'name' : '+actions' ,
"       \ 'c' : [':ColorizerToggle'        , 'colorizer'],
"       \ 'e' : [':CocCommand explorer'    , 'explorer'],
"       \ 'h' : [':let @/ = ""'            , 'remove search highlight'],
"       \ 'l' : [':Bracey'                 , 'start live server'],
"       \ 'L' : [':BraceyStop'             , 'stop live server'],
"       \ 'm' : [':MarkdownPreview'        , 'markdown preview'],
"       \ 'M' : [':MarkdownPreviewStop'    , 'markdown preview stop'],
"       \ 'n' : [':set nonumber!'          , 'line-numbers'],
"       \ 's' : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround'],
"       \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
"       \ 't' : [':FloatermToggle'         , 'terminal'],
"       \ 'v' : [':Codi'                   , 'virtual repl on'],
"       \ 'V' : [':Codi!'                  , 'virtual repl off'],
"       \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
"       \ }

" b is for buffer
" let g:which_key_map.b = {
"       \ 'name' : '+buffer' ,
"       \ '>' : [':BufferMoveNext'        , 'move next'],
"       \ '<' : [':BufferMovePrevious'    , 'move prev'],
"       \ 'b' : [':BufferPick'            , 'pick buffer'],
"       \ 'd' : [':Bdelete'               , 'delete-buffer'],
"       \ 'n' : ['bnext'                  , 'next-buffer'],
"       \ 'p' : ['bprevious'              , 'previous-buffer'],
"       \ '?' : ['Buffers'                , 'fzf-buffer'],
"       \ }

" d is for debug
" let g:which_key_map.d = {
"       \ 'name' : '+debug' ,
"       \ 'b' : ['<Plug>VimspectorToggleBreakpoint'              , 'breakpoint'],
"       \ 'B' : ['<Plug>VimspectorToggleConditionalBreakpoint'   , 'conditional breakpoint'],
"       \ 'c' : ['<Plug>VimspectorRunToCursor'                   , 'run to cursor'],
"       \ 'd' : ['<Plug>VimspectorContinue'                      , 'continue'],
"       \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint'         , 'function breakpoint'],
"       \ 'm' : [':MaximizerToggle'                              , 'maximize window'],
"       \ 'o' : ['<Plug>VimspectorStepOver'                      , 'step over'],
"       \ 'O' : ['<Plug>VimspectorStepOut'                       , 'step out'],
"       \ 'i' : ['<Plug>VimspectorStepInto'                      , 'step into'],
"       \ 'p' : ['<Plug>VimspectorPause'                         , 'pause'],
"       \ 'r' : ['<Plug>VimspectorRestart'                       , 'restart'],
"       \ 's' : ['<Plug>VimspectorStop'                          , 'stop'],
"       \ }

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

" s is for search powered by telescope
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '.' : [':Telescope filetypes'                   , 'filetypes'],
      \ ':' : [':Telescope commands'                    , 'commands'],
      \ 'b' : [':Telescope buffers'                     , 'buffers'],
      \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'],
      \ 'f' : [':Telescope find_files'                  , 'files'],
      \ 'h' : [':Telescope command_history'             , 'history'],
      \ 'H' : [':Telescope highlights'                  , 'highlights'],
      \ 'k' : [':Telescope keymaps'                     , 'keymaps'],
      \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
      \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
      \ 't' : [':Telescope live_grep'                   , 'text'],
      \ 'r' : [':Telescope registers'                   , 'registers'],
      \ }
      " \ 'A' : [':Telescope builtin'                     , 'all'],
      " \ 'a' : [':Telescope lsp_code_actions'            , 'code_actions'],
      " \ 'B' : [':Telescope git_branches'                , 'git branches'],
      " \ 'C' : [':Telescope git_bcommits'                , 'git_bcommits'],
      " \ 'c' : [':Telescope git_commits'                 , 'git_commits'],
      " \ 'F' : [':Telescope git_files'                   , 'git_files'],
      " \ 'G' : [':Telescope current_buffer_tags'         , 'buffer_tags'],
      " \ 'g' : [':Telescope tags'                        , 'tags'],
      " \ 'H' : [':Telescope help_tags'                   , 'help_tags'],
      " \ 'i' : [':Telescope media_files'                 , 'media files'],
      " \ 'l' : [':Telescope loclist'                     , 'loclist'],
      " \ 'm' : [':Telescope marks'                       , 'marks'],
      " \ 'O' : [':Telescope oldfiles'                    , 'oldfiles'],
      " \ 'p' : [':Telescope fd'                          , 'fd'],
      " \ 'P' : [':Telescope spell_suggest'               , 'spell_suggest'],
      " \ 'R' : [':Telescope reloader'                    , 'reloader'],
      " \ 's' : [':Telescope git_status'                  , 'git_status'],
      " \ 'S' : [':Telescope grep_string'                 , 'grep_string'],
      " \ 'u' : [':Telescope colorscheme'                 , 'colorschemes'],
      " \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
      " \ 'Y' : [':Telescope lsp_workspace_symbols'       , 'lsp_workspace_symbols'],
      " \ 'y' : [':Telescope symbols'                     , 'symbols'],
      " \ 'z' : [':Telescope current_buffer_fuzzy_find'   , 'buf_fuz_find'],

let g:which_key_map.S = {
      \ 'name' : '+Sessions' ,
      \ 'l' : [':SessionLoad'           , 'load session'],
      \ 's' : [':SessionSave'           , 'save session'],
      \ }

" g is for git
" let g:which_key_map.g = {
"       \ 'name' : '+git' ,
"       \ 'a' : [':Git add .'                        , 'add all'],
"       \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
"       \ 'b' : [':Git blame'                        , 'blame'],
"       \ 'B' : [':GBrowse'                          , 'browse'],
"       \ 'c' : [':Git commit'                       , 'commit'],
"       \ 'd' : [':Git diff'                         , 'diff'],
"       \ 'D' : [':Gdiffsplit'                       , 'diff split'],
"       \ 'g' : [':GGrep'                            , 'git grep'],
"       \ 'G' : [':Gstatus'                          , 'status'],
"       \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
"       \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
"       \ 'i' : [':Gist -b'                          , 'post gist'],
"       \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
"       \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
"       \ 'l' : [':Git log'                          , 'log'],
"       \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
"       \ 'p' : [':Git push'                         , 'push'],
"       \ 'P' : [':Git pull'                         , 'pull'],
"       \ 'r' : [':GRemove'                          , 'remove'],
"       \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
"       \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
"       \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
"       \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
"       \ 'v' : [':GV'                               , 'view commits'],
"       \ 'V' : [':GV!'                              , 'view buffer commits'],
"       \ }
      " \ 'A' : [':Git add %'                        , 'add current'],
      " \ 'S' : [':!git status'                      , 'status'],
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'b' : [':execute "lua require\"gitsigns\".blame_line()"'       , 'blame line'],
      \ 'B' : [':GitBlameToggle'                                       , 'blame toggle'],
      \ 'd' : [':Gdiff'                                                , 'diff buffer'],
      \ 'p' : [':execute "lua require\"gitsigns\".preview_hunk()"'     , 'preview hunk'],
      \ 'r' : [':execute "lua require\"gitsigns\".reset_hunk()"'       , 'reset hunk'],
      \ 'R' : [':execute "lua require\"gitsigns\".reset_buffer()"'     , 'reset buffer'],
      \ 's' : [':execute "lua require\"gitsigns\".stage_hunk()"'       , 'stage hunk'],
      \ 'u' : [':execute "lua require\"gitsigns\".undo_stage_hunk()"'  , 'undo stage hunk'],
      \ }

" let g:which_key_map.G = {
"       \ 'name' : '+gist' ,
"       \ 'a' : [':Gist -a'                          , 'post gist anon'],
"       \ 'b' : [':Gist -b'                          , 'post gist browser'],
"       \ 'd' : [':Gist -d'                          , 'delete gist'],
"       \ 'e' : [':Gist -e'                          , 'edit gist'],
"       \ 'l' : [':Gist -l'                          , 'list public gists'],
"       \ 's' : [':Gist -ls'                         , 'list starred gists'],
"       \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
"       \ 'p' : [':Gist -P'                          , 'post public gist '],
"       \ 'P' : [':Gist -p'                          , 'post private gist '],
"       \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'a' : [':Lspsaga code_action'                , 'code action'],
      \ 'A' : [':Lspsaga range_code_action'          , 'selected action'],
      \ 'd' : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
      \ 's' : [':Lspsaga signature_help'             , 'signature_help'],
      \ 'I' : [':LspInfo'                            , 'lsp info'],
      \ 'l' : [':Lspsaga lsp_finder'                 , 'lsp finder'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'p' : [':Lspsaga preview_definition'         , 'preview definition'],
      \ 'q' : [':Telescope quickfix'                 , 'quickfix'],
      \ 'r' : [':LspSaga rename'                     , 'rename'],
      \ 'v' : [':LspVirtualTextToggle'               , 'lsp toggle virtual text'],
      \ 'x' : [':cclose'                             , 'close quickfix'],
      \ }
      " \ 'f' : [':LspFormatting'                      , 'format'],
      " \ 'L' : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      " \ 's' : [':Telescope lsp_document_symbols'     , 'document symbols'],
      " \ 'S' : [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
      " \ 'T' : [':LspTypeDefinition'                  , 'type defintion'],

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ':' : [':FloatermNew --wintype=normal --height=6'       , 'tiny terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }
      " \ 'n' : [':FloatermNew node'                              , 'node'],
      " \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      " \ 'p' : [':FloatermNew python'                            , 'python'],
      " \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      " \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      " \ 'u' : [':FloatermNew ncdu'                              , 'ncdu'],

call which_key#register('<Space>', "g:which_key_map")
