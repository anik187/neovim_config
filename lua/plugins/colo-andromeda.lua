return {
	"nobbmaestro/nvim-andromeda",
	dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },

	config = function()
		local andromeda = require("andromeda")
		andromeda.setup({
			preset = "andromeda",
			styles = {
				italic = true,
			},
		})
	end,
}
