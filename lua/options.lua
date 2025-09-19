-- local and global variables
---@diagnostic disable-next-line: undefined-global
vim.g.mapleader = " "

-- global options
local opt = vim.o

opt.number = true
opt.relativenumber = true
opt.winborder = "rounded"
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
opt.showmode = true
opt.mouse = "a"
opt.autochdir = false
-- opt.autoread = true -- special change
opt.showtabline = 1
opt.clipboard = "unnamedplus"
opt.laststatus = 2
opt.pumheight = 10
opt.cmdheight = 1
opt.listchars = "precedes:,extends:"

-- local window options
opt.conceallevel = 0
opt.signcolumn = "yes"
opt.numberwidth = 4
opt.wrap = false
opt.cursorline = false
opt.cursorcolumn = true

-- local buffer options

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.expandtab = true
opt.formatoptions = "cro"
opt.fileencoding = "utf-8"
opt.autoindent = true
opt.smartindent = true

vim.g.markdown_fenced_languages = { "sh", "vim" }

vim.g.termbufm_direction_cmd = "new"

