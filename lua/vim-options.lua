-- local and global variables
vim.g.mapleader = " "

-- global options
local opt = vim.opt

opt.ruler = false
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.hlsearch = true
opt.background = "dark"
opt.termguicolors = true
opt.hidden = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.completeopt = "menuone,noinsert,noselect"
opt.showmode = false
opt.mouse = "a"
opt.autochdir = false
opt.showtabline = 1
opt.clipboard = "unnamedplus"
opt.laststatus = 2
opt.pumheight = 10
opt.cmdheight = 1
opt.listchars = "precedes:,extends:"

-- local window options
local win_opt = vim.wo
win_opt.conceallevel = 0
win_opt.number = true
win_opt.relativenumber = true
win_opt.signcolumn = "yes"
win_opt.numberwidth = 4
win_opt.wrap = false
win_opt.cursorline = true
win_opt.cursorcolumn = true

-- local buffer options
local buffer_opt = vim.bo

buffer_opt.tabstop = 2
buffer_opt.softtabstop = 2
buffer_opt.shiftwidth = 2
buffer_opt.autoindent = true
buffer_opt.expandtab = true
buffer_opt.formatoptions = "cro"
buffer_opt.fileencoding = "utf-8"
buffer_opt.autoindent = true
buffer_opt.smartindent = true

vim.g.markdown_fenced_languages = { "sh", "vim" }

vim.g.termbufm_direction_cmd = "new"
