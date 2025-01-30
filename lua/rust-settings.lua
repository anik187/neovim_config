vim.api.nvim_create_augroup("RustAutoCmds", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "RustAutoCmds",
	pattern = "*.rs",
	callback = function()
		vim.cmd("silent !rustfmt %")
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "RustAutoCmds",
	pattern = "*.rs",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		-- Check if it's a Rust file
		if vim.bo[bufnr].filetype == "rust" then
			if client and client.name == "null-ls" then -- Change "tsserver" to your LSP
				client.stop() -- Disable this LSP client for Rust
			end
		end
	end,
})
