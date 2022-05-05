local wk = require("which-key")

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        },
        spelling = {enabled = true, suggestions = 20} -- use which-key for spelling hints
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local mappings = {
    q = {"<cmd>q!<CR>", "quit without saving"},
    w = {"<cmd>w<CR>", "save file"},
    h = {"<cmd>noh<CR>", "disable highlight"},
    ["/"] = {"<cmd>CommentToggle<CR>", "CommentToggle"},

    t = {
        name = "terminal",
        p = {"<cmd>FloatermNew python3<CR>", "python repl"},
        n = {"<cmd>FloatermNew node<CR>", "node repl"},
        r = {"<cmd>FloatermNew ranger<CR>", "ranger filemanager"}
    },

    b = {
        name = "buffer actions",
        n = {"<cmd>bNext<CR>", "next buffer"},
        p = {"<cmd>bprevious<CR>", "previous buffer"},
        d = {"<cmd>bd<CR>", "delete current buffer"}
    },

    p = {
        name = "Packer",
        c = {"<cmd>PackerCompile<cr>", "Compile"},
        i = {"<cmd>PackerInstall<cr>", "Install"},
        r = {"<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload"},
        s = {"<cmd>PackerSync<cr>", "Sync"},
        S = {"<cmd>PackerStatus<cr>", "Status"},
        u = {"<cmd>PackerUpdate<cr>", "Update"}
    },

    g = {
        name = "Git",
        j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
        l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
        p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk"
        },
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)"
        },
        d = {"<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff"}
    },

    l = {
        name = "LSP",
        ["gD"] = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration"},
        ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition"},
        ["gr"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"},
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics"
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        I = {"<cmd>LspInstallInfo<cr>", "Installer Info"},
        j = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic"},
        k = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic"},
        l = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        K = {"<cmd>Lspsaga hover_doc<cr>", "Documentation"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        a = {"<cmd>Lspsaga show_line_diagnostics<cr>", "lsp Diagnostics"}
    },
    s = {
        name = "Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
        C = {"<cmd>Telescope commands<cr>", "Commands"},
        p = {
            "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview"
        }
    },
    T = {name = "Treesitter", i = {":TSConfigInfo<cr>", "Info"}}
}

local vmappings = {["/"] = {":'<,'>CommentToggle<cr>", "Comment"}}

-- local opts = { prefix = "<leader>" }
local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true -- use `nowait` when creating keymaps
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true -- use `nowait` when creating keymaps
}
wk.setup(setup)
wk.register(mappings, opts)
wk.register(vmappings, vopts)
