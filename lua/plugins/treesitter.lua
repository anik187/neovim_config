return {
	{
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-ts-autotag",
		"HiPhish/rainbow-delimiters.nvim",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
					filetypes = {
						"html",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"svelte",
						"vue",
						"tsx",
						"jsx",
						"rescript",
						"css",
						"lua",
						"xml",
						"php",
						"markdown",
					},
				},
				rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
			})
		end,
	},
}
