return {
	"windwp/nvim-autopairs",
	config = function()
		local autopairs = require("nvim-autopairs")
		-- configure autopairs
		autopairs.setup({
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- import nvim-cmp plugin safely (completions plugin)
		local cmp_setup, cmp = pcall(require, "cmp")
		if not cmp_setup then
			return
		end

		-- make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
