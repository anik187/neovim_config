return {
	"numToStr/FTerm.nvim",
	events = { "BufReadPre", "BufReadFile" },
	config = function()
		require("FTerm").setup({
			border = "single",
			dimensions = {
				height = 0.6,
				width = 0.5,
				x = 0.5,
				y = 0.5,
			},
		})

		-- Example keybindings
		vim.keymap.set("n", "<F2>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<F2>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
