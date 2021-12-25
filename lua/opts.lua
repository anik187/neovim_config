-- local and global variables

vim.g.mapleader = ' '
vim.b.mapleader = ' '

-- global options

vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.backup = false
vim.o.writebackup = false
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmode = false
vim.o.mouse = 'a'
vim.o.autochdir = true
vim.o.showtabline = 2
vim.o.clipboard = 'unnamedplus'
vim.o.laststatus = 2
vim.o.pumheight = 10
vim.o.cmdheight = 1


-- local window options

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.wrap = false
vim.wo.cursorline = true


-- local buffer options

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.formatoptions = 'cro'
vim.bo.formatoptions = 'cro'
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.bo.smartindent = true

vim.cmd([[
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
]])

vim.cmd('language en_US.utf-8')
vim.wo.list = true
vim.o.listchars = 'trail:·,precedes:,extends:'

vim.g.markdown_fenced_languages = {'sh', 'vim'}

vim.g.termbufm_direction_cmd = 'new'
