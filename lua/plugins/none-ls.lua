return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.prettier.with({
					extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--tab-width 2" },
				}),
				formatting.stylua, -- lua formatter
				formatting.black, -- python formatter
				formatting.isort, -- python formatter
				-- formatting.yamlfmt, -- yaml file formatter
				-- formatting.rustfmt, -- rust formatter
				-- formatting.clang - format, -- c/cpp formatter
				-- diagnostics.eslint_d.with({ -- js/ts linter
				-- 	-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.ejs" }) -- change file extension if you use something else
				-- 	end,
				-- }),
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}