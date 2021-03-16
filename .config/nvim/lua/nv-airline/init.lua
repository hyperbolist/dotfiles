-- don't show vim-native mode, let airline show the mode
vim.o.showmode=false

-- enable powerline fonts, almost certainly requires a patched font
-- been using Meslo for Powerline for years
-- switched to MesloLGS Nerd Font Mono to gain some other glyphs
-- $ brew tap homebrew/cask-fonts
-- $ brew cask install font-meslo-nerd-font
-- see https://github.com/ryanoasis/nerd-fonts
vim.api.nvim_set_var('airline_powerline_fonts', 1)

-- make airline looke mostly like classic powerline
vim.api.nvim_set_var('airline_theme','powerlineish_tweaked')
vim.api.nvim_set_var('airline#extensions#branch#enabled', 1)
vim.api.nvim_set_var('airline#parts#ffenc#skip_expected_string','utf-8[unix]') -- don't show the common encoding

vim.api.nvim_exec(
[[
let g:airline_section_b = airline#section#create_left(['%{airline#extensions#branch#get_head()}']) " just branch
let g:airline_section_x = airline#section#create(['%{airline#parts#ffenc()}', ' %{airline#parts#filetype()}']) " moves encoding from section_y to section_x
let g:airline_section_y = airline#section#create(['%1p%%']) " percent of document
let g:airline_section_z = airline#section#create(['%{g:airline_symbols.linenr}', '%l:%c']) " line / column count
]], false)

-- but remove the separator arrow characters)
vim.api.nvim_set_var('airline_left_sep', '')
vim.api.nvim_set_var('airline_right_sep', '')
vim.api.nvim_set_var('airline_right_alt_sep', '')

-- warnings
vim.api.nvim_set_var('airline#extensions#quickfix#quickfix_text', 'Quickfix')
vim.api.nvim_set_var('airline#extensions#quickfix#location_text', 'Location')

-- airline's tabline
vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
vim.o.showtabline=2 -- even though we don't use tabs, it shows all open buffers in airline's tabline
vim.api.nvim_set_var('airline#extensions#tabline#formatter', 'unique_tail_improved')
vim.api.nvim_set_var('airline#extensions#tabline#left_sep', '')
vim.api.nvim_set_var('airline#extensions#tabline#left_alt_sep', '')
vim.api.nvim_set_var('airline#extensions#tabline#right_sep', '')
vim.api.nvim_set_var('airline#extensions#tabline#right_alt_sep', '')
vim.api.nvim_set_var('airline#extensions#tabline#show_tab_type', 0) -- we don't use tabs, so remove the 'buffers' label
