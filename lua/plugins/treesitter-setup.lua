return {
	{
		"nvim-treesitter/nvim-treesitter",
		"HiPhish/rainbow-delimiters.nvim",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
        ensure_installed = {"lua","javascript","css","html","python","c"},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
				auto_install = true,
			})
		end,
	},
}
