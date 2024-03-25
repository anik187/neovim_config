return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			auto_reload_on_write = true,
			disable_netrw = true,
			hijack_netrw = true,
			-- ignore_ft_on_setup = { "dashboard" },
			renderer = {
				root_folder_modifier = table.concat({
					":t:gs?$?/..",
					string.rep(" ", 1000),
					"?:gs?^??",
				}),
				highlight_opened_files = "none",
				add_trailing = false,
				indent_markers = { enable = true },
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			git = { enable = true, ignore = false },
			open_on_tab = false,
			hijack_cursor = true,
			update_cwd = true,
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = false,
					window_picker = {
						enable = true,
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "dashboard", "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
			},
			filters = { dotfiles = false, custom = { ".git", "node_modules", ".cache" } },
			update_focused_file = { enable = true, update_cwd = true },
			view = {
				-- allow_resize = false,
				side = "left",
				width = 28,
			},
		})
		-- File Explorer
		vim.api.nvim_set_keymap("n", "<F1>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
	end,
}
