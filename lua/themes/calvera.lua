-- Example config in lua
vim.g.calvera_italic_comments = true
vim.g.calvera_italic_keywords = false
vim.g.calvera_italic_functions = true
vim.g.calvera_italic_variables = false
vim.g.calvera_contrast = true
vim.g.calvera_borders = false
vim.g.calvera_disable_background = false
vim.g.transparent_bg = false
--vim.g.calvera_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('calvera').set()
