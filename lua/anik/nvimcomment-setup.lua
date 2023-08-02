local nvim_comment_status_ok, nvim_comment = pcall(require, "nvim_comment")
if not nvim_comment_status_ok then
	return
end

nvim_comment.setup({
	-- Linters prefer comment and line to have a space in between markers
	marker_padding = true,
	-- should comment out empty or whitespace only lines
	comment_empty = false,
	-- Should key mappings be created
	create_mappings = false,
})
