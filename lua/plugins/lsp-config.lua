return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"cssls",
				"html",
				"ts_ls",
				"emmet_ls",
				"pyright",
				"tailwindcss",
				"rust_analyzer",
			},
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		diagnostics = { virtual_text = true },
		config = function()
			local icons = require("icons")
			local signs = { Error = " ", Warn = " ", Hint = icons.diagnostics.BoldHint, Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(client, bufnr)
				-- keybind options
				local opts = { noremap = true, silent = true, buffer = bufnr }
				if client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true)
				end

				-- set keybinds
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- got to declaration
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- got to declaration
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- see definition and make edits in window
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
				vim.keymap.set("n", "<leader>d", function()
					vim.diagnostic.open_float({ border = "rounded" })
				end, opts)

				-- typescript specific keymaps (e.g. rename file and update imports)
				--if client.name == "tsserver" then
				--	keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
				--	keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
				--	keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
				--end
			end
			local lspconfig = require("lspconfig")
			local servers = {
				"lua_ls",
				"html",
				"cssls",
				"emmet_ls",
				"tailwindcss",
				"ts_ls",
				"pyright",
				"rust_analyzer",
			}
			for _, server in ipairs(servers) do
				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
				}
				local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
				if require_ok then
					opts = vim.tbl_deep_extend("force", settings, opts)
				end
				lspconfig[server].setup(opts)
			end
		end,
	},
}
