local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
	return
end

colorizer.setup({
	filetypes = { "*", html = { names = true }, css = { names = true } },
	user_default_options = {
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		tailwind = true, -- Enable tailwind colors
	},
	buftypes = {},
})
