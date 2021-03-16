-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- moved into packer setup for colorscheme plugin
-- there's something strange happening with the 0.5 nightlies
-- with respect to lua, packer and highlighting
--vim.cmd('highlight! QuickScopePrimary   ctermfg=black ctermbg=yellow cterm=underline')
--vim.cmd('highlight! QuickScopeSecondary ctermfg=black ctermbg=cyan   cterm=underline')

vim.g.qs_max_chars=150
