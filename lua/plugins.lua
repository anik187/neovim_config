local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer, close and reopen Neovim"
  vim.cmd 'packadd packer.nvim'
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- icons secton
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  -- statusline section
  use 'windwp/windline.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use "lukas-reineke/indent-blankline.nvim"
  -- theme section
  use {'dracula/vim', as = 'dracula'}
  use "lunarvim/darkplus.nvim"
  use 'navarasu/onedark.nvim'
  use "rafamadriz/neon"
  use 'yashguptaz/calvera-dark.nvim'
  use 'folke/tokyonight.nvim'
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      tag = 'v0.1.0', -- Optional tag release
  })
  use 'romgrk/doom-one.vim'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'norcalli/nvim-colorizer.lua'
  -- file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
  }

  --lsp config
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'tami5/lspsaga.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'voldikss/vim-floaterm'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
    'nvim-lua/plenary.nvim'
    },
  -- tag = 'release' -- To use the latest release
  }
  use 'folke/which-key.nvim'
  use "terrortylor/nvim-comment"
  use "numtostr/FTerm.nvim"
  use 'glepnir/dashboard-nvim'
  use 'airblade/vim-rooter'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if BOOTSTRAP then
    require("packer").sync()
  end
end)
