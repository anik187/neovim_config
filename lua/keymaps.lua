local keymap = vim.keymap

local opt = { noremap = true, silent = true }

keymap.set("n", "zz", ":q!<CR>", opt)

-- mapping hjkl to jkl;
keymap.set("n", "j", "h", opt)
keymap.set("n", "k", "j", opt)
keymap.set("n", "l", "k", opt)
keymap.set("n", ";", "l", opt)
keymap.set("v", "j", "h", opt)
keymap.set("v", "k", "j", opt)
keymap.set("v", "l", "k", opt)
keymap.set("v", ";", "l", opt)

-- mapping jk kj to escape
keymap.set("i", "jk", "<Esc>", opt)
keymap.set("i", "kj", "<Esc>", opt)
-- Better tabbing
keymap.set("v", "<", "<gv", opt)
keymap.set("v", ">", ">gv", opt)

-- Better window navigation
keymap.set("n", "<C-j>", "<C-w>h", opt)
keymap.set("n", "<C-k>", "<C-w>j", opt)
keymap.set("n", "<C-l>", "<C-w>k", opt)
keymap.set("n", "<C-h>", "<C-w>l", opt)
keymap.set("n", "<C-c>", "<C-w>c", opt)

-- Better tab navigation
keymap.set("n", "<TAB>", ":tabnext<cr>", opt)
keymap.set("n", "<S-TAB>", ":tabprevious<cr>", opt)

keymap.set("n", "<leader>h", ":noh<CR>", opt)
keymap.set("n", "<leader>w", "<cmd>w<cr>", opt)
