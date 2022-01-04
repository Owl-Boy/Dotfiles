local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'
  use 'akinsho/toggleterm.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'folke/which-key.nvim'
  use 'tpope/vim-surround'
  use 'junegunn/goyo.vim'

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Welcome Screen
  use 'goolord/alpha-nvim'
  use 'BlakeJC94/alpha-nvim-fortune'

  -- Colorschemes
  use 'lunarvim/colorschemes'
  use 'lunarvim/darkplus.nvim'
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'NTBBloodbath/doom-one.nvim'
  use 'shaunsingh/nord.nvim'
  use 'mhartington/oceanic-next'
  use 'overcache/NeoSolarized'
  use 'haishanh/night-owl.vim'
  use 'junegunn/limelight.vim'

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tamago324/nlsp-settings.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'p00f/nvim-ts-rainbow'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
