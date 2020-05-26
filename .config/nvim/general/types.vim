" filetype specific settings
if has('autocmd') && !exists('filetype_autocommands_loaded')
  let filetype_autocommands_loaded = 1

  " tabs
  " TODO change this to .editorconfig ?
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab "indentkeys-=*<return>
  autocmd FileType html.handlebars setlocal ts=4 sts=4 sw=4 expandtab "indentkeys-=*<return>
  autocmd FileType markdown,textile setlocal ts=4 sts=4 sw=4 expandtab textwidth=0 wrapmargin=0 wrap " spell
  autocmd FileType crontab setlocal nobackup nowritebackup
  autocmd FileType fish setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cs setlocal ts=4 sts=4 sw=4 expandtab

  autocmd BufNewFile,BufRead *.ejs set filetype=html

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
endif
