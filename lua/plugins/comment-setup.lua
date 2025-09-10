return {
	"terrortylor/nvim-comment",
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		local comment = require("nvim_comment")
		comment.setup({
			-- should comment out empty or whitespace only lines
			comment_empty = false,
			-- Should key mappings be created
			create_mappings = false,
		})
		vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<cr>", { noremap = true, silent = true })
		vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<cr>", { noremap = true, silent = true })
	end,
}
