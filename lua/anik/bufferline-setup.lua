vim.opt.termguicolors = true
require("bufferline").setup{}
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', {silent = true})
--nnoremap <silent><mymap> :BufferLineMoveNext<CR>
--nnoremap <silent><mymap> :BufferLineMovePrev<CR>
