" general autocommands
if has('autocmd') && !exists('general_autocommands_loaded')
  let general_autocommands_loaded = 1

  " focus indicator
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline

  " automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='

  " make quickfix windows take all the lower section of the screen when there
  " are multiple windows open
  autocmd FileType qf wincmd J
endif
