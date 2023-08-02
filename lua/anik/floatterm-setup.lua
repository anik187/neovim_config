local term_status_ok, fterm = pcall(require, "FTerm")
if not term_status_ok then
	return
end

fterm.setup({
	border = "solid",
	dimensions = { height = 0.8, width = 0.8 },
})

-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<F2>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
map("t", "<F2>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
