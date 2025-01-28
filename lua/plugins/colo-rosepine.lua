return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		local rosepine = require("rose-pine")
		rosepine.setup({
			variant = "moon",
		})
	end,
}
