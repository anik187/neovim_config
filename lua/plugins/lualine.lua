return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				-- ignore_focus = { "NvimTree" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diagnostics", "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = {},
			},
			extensions = { "quickfix", "man", "fugitive" },
		})
	end,
}
