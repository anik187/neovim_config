local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer, close and reopen Neovim")
	vim.cmd("packadd packer.nvim")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return packer.startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	-- icons secton
	use("ryanoasis/vim-devicons")
	use("nvim-tree/nvim-web-devicons")
	-- statusline section
	-- use("windwp/windline.nvim")
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("lukas-reineke/indent-blankline.nvim")

	-- theme section
	use("morhetz/gruvbox")
	use("bluz71/vim-nightfly-guicolors")

	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("p00f/nvim-ts-rainbow")
	use("NvChad/nvim-colorizer.lua")
	-- file explorer
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"roobert/tailwindcss-colorizer-cmp.nvim",
			config = function()
				require("tailwindcss-colorizer-cmp").setup({
					color_square_width = 2,
				})
			end,
		},
	}) -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use("tami5/lspsaga.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		-- tag = 'release' -- To use the latest release
	})

	use("folke/which-key.nvim")
	use("terrortylor/nvim-comment")
	use("numtostr/FTerm.nvim")
	-- use("glepnir/dashboard-nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if BOOTSTRAP then
		require("packer").sync()
	end
end)
