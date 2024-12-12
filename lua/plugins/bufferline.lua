return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({})

			vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })

			vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })
		end,
	},
}
