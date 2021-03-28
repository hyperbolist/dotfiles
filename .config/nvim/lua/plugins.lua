local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'ray-x/lsp_signature.nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag' -- html/vue tag closing and renaming

  -- Sessions
  use 'glepnir/dashboard-nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line and Bufferline
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'


  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Explorers
  use 'kyazdani42/nvim-tree.lua'
  use 'jeetsukumaran/vim-filebeagle'

  -- Color
  --use 'norcalli/nvim-colorizer.lua'
  use {
    'fnune/base16-vim',
    config = function()
      vim.api.nvim_exec(
      [[
      " let tmux set colors when the tmux pane containing this editor becomes inactive
      hi Normal ctermfg=none ctermbg=none guifg=none guibg=none
      hi LineNr              ctermbg=none            guibg=none
      hi SignColumn          ctermbg=none            guibg=none

      " selection
      "hi Visual ctermfg=18 ctermbg=3 guifg=#282a2e guibg=#f0c674

      " telescope would have used Visual
      "hi TelescopeSelection ctermbg=19 guibg=#373b41
      "hi TelescopeLinePreview ctermbg=19 guibg=#373b41

      " spelling
      hi SpellBad   ctermfg=0 ctermbg=9  gui=undercurl guifg=#000000 guibg=#cc6666
      hi SpellCap   ctermfg=0 ctermbg=12 gui=undercurl guifg=#000000 guibg=#81a2be
      hi SpellRare  ctermfg=0 ctermbg=13 gui=undercurl guifg=#000000 guibg=#b294bb
      hi SpellLocal ctermfg=0 ctermbg=14 gui=undercurl guifg=#000000 guibg=#8abeb7

      " barbar tabline
      hi BufferCurrent        guifg=#ffffff guibg=#373b41
      hi BufferCurrentIcon                  guibg=#373b41
      hi BufferCurrentIndex   guifg=#81a2be guibg=#373b41
      hi BufferCurrentMod     guifg=#f0c674 guibg=#373b41
      hi BufferCurrentSign    guifg=#81a2be guibg=#373b41
      hi BufferCurrentTarget  guifg=#ff0000 guibg=#373b41
      hi BufferVisible        guifg=#969896 guibg=#282a2e
      hi BufferVisibleIcon                  guibg=#282a2e
      hi BufferVisibleIndex   guifg=#81a2be guibg=#282a2e
      hi BufferVisibleMod     guifg=#f0c674 guibg=#282a2e
      hi BufferVisibleSign    guifg=#282a2e guibg=#282a2e
      hi BufferVisibleTarget  guifg=#ff0000 guibg=#282a2e
      hi BufferInactive       guifg=#969896 guibg=#282a2e
      hi BufferInactiveIcon                 guibg=#282a2e
      hi BufferInactiveIndex  guifg=#81a2be guibg=#282a2e
      hi BufferInactiveMod    guifg=#f0c674 guibg=#282a2e
      hi BufferInactiveSign   guifg=#282a2e guibg=#282a2e
      hi BufferInactiveTarget guifg=#ff0000 guibg=#282a2e
      ]], false)
    end
  }

  -- Git
  use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'tpope/vim-fugitive' -- mostly to grant airline the ability to detect branch, also for :Gdiff
  use 'f-person/git-blame.nvim'

  -- prose mode
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- General Plugins
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'
  use {
    'unblevable/quick-scope',
    config = function()
      vim.api.nvim_exec(
      [[
      highlight QuickScopePrimary   ctermfg=black ctermbg=yellow cterm=underline
      highlight QuickScopeSecondary ctermfg=black ctermbg=cyan   cterm=underline
      ]], false)
    end
  }
  use 'airblade/vim-rooter'
  use 'b3nj5m1n/kommentary'
  use 'kevinhwang91/rnvimr'
  --use 'metakirby5/codi.vim'
  use 'psliwka/vim-smoothie'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
  use 'moll/vim-bbye'
  --use 'turbio/bracey.vim'
  --use 'AndrewRadev/tagalong.vim'
  --use 'alvan/vim-closetag'
  --use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](1) end }
  use 'liuchengxu/vim-which-key'
  use 'tpope/vim-sleuth'
  use 'voldikss/vim-floaterm'
  use 'tpope/vim-unimpaired'
  use 'liuchengxu/vista.vim'
end)
