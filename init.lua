-- defaults --
require("opts")
require("mappings")

vim.pack.add({
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/saghen/blink.pairs", version = vim.version.range("*") },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/terrortylor/nvim-comment" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
})

require("tree-sitter-manager").setup({
	border = "rounded",
	auto_install = true,
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("gruvbox").setup()
require("mini.icons").setup()
vim.cmd.colorscheme("gruvbox")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
vim.api.nvim_set_keymap("n", "<F1>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

local comment = require("nvim_comment")
comment.setup({
	-- should comment out empty or whitespace only lines
	comment_empty = false,
	-- Should key mappings be created
	create_mappings = false,
})
vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<cr>", { noremap = true, silent = true })

require("nvim-highlight-colors").setup({})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

--- lsp , autocomplete setup ---

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 400 },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		prebuilt_binaries = { download = true },
	},
})

require("blink.pairs").download():pwait(60000)
require("blink.pairs").setup()

require("conform").setup({
	formatters_by_ft = {
		python = { "black", "isort" },
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		local has_conform_formatter = require("conform").list_formatters(args.buf)[1] ~= nil

		if has_conform_formatter then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
	end,
})

vim.api.nvim_create_user_command("FormatToggle", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	vim.notify("Autoformat on save " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, { desc = "Toggle format on save" })

local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			},
		},
	},
})

vim.lsp.enable({ "bash_ls", "lua_ls", "pyright", "ts_ls" })
