local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'ray-x/lsp_signature.nvim'
  --use 'mfussenegger/nvim-jdtls'

  -- Debugging
  --use 'mfussenegger/nvim-dap'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'

  -- Sessions
  use 'mhinz/vim-startify'

  -- Icons
  --use 'kyazdani42/nvim-web-devicons'
  --use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  --use 'nvim-telescope/telescope-media-files.nvim'

  -- Explorers
  use 'kyazdani42/nvim-tree.lua'
  use 'jeetsukumaran/vim-filebeagle'

  -- Color
  --use 'christianchiarulli/nvcode-color-schemes.vim'
  --use 'norcalli/nvim-colorizer.lua'
  use {
    'chriskempson/base16-vim',
    config = function()
      vim.api.nvim_exec(
      [[
      " let tmux set colors when the tmux pane containing this editor becomes inactive
      hi Normal ctermfg=none ctermbg=none
      " spelling
      hi SpellBad   ctermfg=black ctermbg=9  gui=undercurl guisp=#c82829
      hi SpellCap   ctermfg=black ctermbg=12 gui=undercurl guisp=#4271ae
      hi SpellRare  ctermfg=black ctermbg=13 gui=undercurl guisp=#8959a8
      hi SpellLocal ctermfg=black ctermbg=14 gui=undercurl guisp=#3e999f
      ]], false)
    end
  }

  -- Git
  use 'TimUntersberger/neogit'
  use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'tpope/vim-fugitive' -- merely to grant airline the ability to detect branch
  use 'f-person/git-blame.nvim'

  -- Easily Create Gists
  --use 'mattn/vim-gist'
  --use 'mattn/webapi-vim'

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
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
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

  -- TODO investigate these
  --use 'RRethy/vim-illuminate'
end)
