return {
	"NvChad/nvim-colorizer.lua",
	events = { "BufReadPost", "BufNewFile" },
	config = function()
		local colorizer = require("colorizer")
		colorizer.setup({
			filetypes = {
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"css",
				"html",
				"astro",
				"lua",
				"python",
				"go",
				"docker",
			},
			user_default_options = {
				names = false,
				rgb_fn = true,
				hsl_fn = true,
				tailwind = "both",
			},
		})
	end,
}
