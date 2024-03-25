local M = {
	"neogitorg/neogit",
	event = "VeryLazy",
}

function M.config()
	local icons = require("icons")
	vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { silent = true, noremap = true })
	require("neogit").setup({
		auto_refresh = true,
		disable_builtin_notifications = false,
		use_magit_keybindings = false,
		-- Change the default way of opening neogit
		kind = "tab",
		-- Change the default way of opening the commit popup
		commit_popup = {
			kind = "split",
		},
		-- Change the default way of opening popups
		popup = {
			kind = "split",
		},
		-- customize displayed signs
		signs = {
			-- { CLOSED, OPENED }
			section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
			item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
			hunk = { "", "" },
		},
	})
end

return M
