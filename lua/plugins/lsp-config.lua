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
				"pyright",
				"tsserver",
				"tailwindcss",
				"emmet_ls",
				"rust_analyzer",
			},
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		diagnostics = {},
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
					vim.lsp.inlay_hint.enable(bufnr, true)
				end

				-- set keybinds
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- got to declaration
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- got to declaration
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- see definition and make edits in window
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

				-- typescript specific keymaps (e.g. rename file and update imports)
				--if client.name == "tsserver" then
				--	keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
				--	keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
				--	keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
				--end
			end
			local lspconfig = require("lspconfig")
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								-- Tells lua_ls where to find all the Lua files that you have loaded
								-- for your neovim configuration.
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
								-- If lua_ls is really slow on your computer, you can try this instead:
								-- library = { vim.env.VIMRUNTIME },
							},
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},

				"html",
				"cssls",
				"tailwindcss",
				"pyright",
				"tsserver",
				"rust_analyzer",
				"emmet_ls",
			}
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end,
	},
}
