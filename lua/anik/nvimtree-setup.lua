local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
-- g.nvim_tree_git_hl = git_status
g.nvim_tree_highlight_opened_files = 0
-- g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat({
	":t:gs?$?/..",
	string.rep(" ", 1000),
	"?:gs?^??",
})
--
g.nvim_tree_show_icons = {
	folders = 1,
	folder_arrows = 1,
	files = 1,
	git = 1,
}

g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		deleted = "",
		ignored = "◌",
		renamed = "➜",
		staged = "✓",
		unmerged = "",
		unstaged = "✗",
		untracked = "★",
	},
	folder = {
		-- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
		-- arrow_open = "",
		-- arrow_closed = "",
		default = "",
		empty = "", -- 
		empty_open = "",
		open = "",
		symlink = "",
		symlink_open = "",
	},
}

nvimtree.setup({
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = { "dashboard" },
	renderer = { indent_markers = { enable = true }, icons = { webdev_colors = true } },
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
