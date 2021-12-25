local api = vim.api

opt = { noremap = true , silent = true}

api.nvim_set_keymap('n', 'zz', ':q!<CR>',opt)

vim.cmd([[
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + jkl; to resize windows
nnoremap <M-k>    :resize -2<CR>
nnoremap <M-l>    :resize +2<CR>
nnoremap <M-j>    :vertical resize -2<CR>
nnoremap <M-;>    :vertical resize +2<CR>

]])

-- mapping hjkl to jkl;
api.nvim_set_keymap('n', 'j', 'h', opt)
api.nvim_set_keymap('n', 'k', 'j', opt)
api.nvim_set_keymap('n', 'l', 'k', opt)
api.nvim_set_keymap('n', ';', 'l', opt)
api.nvim_set_keymap('v', 'j', 'h', opt)
api.nvim_set_keymap('v', 'k', 'j', opt)
api.nvim_set_keymap('v', 'l', 'k', opt)
api.nvim_set_keymap('v', ';', 'l', opt)

--mapping jk kj to escape
api.nvim_set_keymap('i', 'jk', '<Esc>',opt)
api.nvim_set_keymap('i', 'kj', '<Esc>',opt)

-- Better tabbing
api.nvim_set_keymap('v', '<', '<gv', opt)
api.nvim_set_keymap('v', '>', '>gv', opt)

--tab navigation
api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap=false, silent = true})
api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap=false, silent= true})

-- Better window navigation
api.nvim_set_keymap('n', '<C-j>', '<C-w>h', opt)
api.nvim_set_keymap('n', '<C-k>', '<C-w>j', opt)
api.nvim_set_keymap('n', '<C-l>', '<C-w>k', opt)
api.nvim_set_keymap('n', '<C-;>', '<C-w>l', opt)
api.nvim_set_keymap('n', '<C-c>', '<C-w>c', opt)

-- File Explorer
api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<CR>', opt)
