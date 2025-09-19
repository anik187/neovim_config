require "options"
require "keymaps"

vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/Saghen/blink.cmp",               version = 'main'},
})

vim.lsp.enable({ "lua_ls", "emmet_ls", "pyright", "ts_ls", "tailwindcss" })
vim.lsp.config['lua_ls'] = {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        -- Tells lua_ls where to find all the Lua files that you have loaded
        -- for your neovim configuration.
        --library = {
        --	"${3rd}/luv/library",
        --	unpack(vim.api.nvim_get_runtime_file("", true)),
        --},
        -- If lua_ls is really slow on your computer, you can try this instead:
        library = { vim.env.VIMRUNTIME },
      },
      completion = {
        callSnippet = "Replace",
      },
      -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
    },
  },


}
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
require "kanagawa".setup()
require "nvim-treesitter.configs".setup({
  ensure_installed = { "lua", "javascript", "css", "html", "python", "c" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
  auto_install = true,
})

require "blink.cmp".setup({
  enable = true,

  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },
  -- (Default) Only show the documentation popup when manually triggered
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

})
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
vim.cmd("colorscheme kanagawa")
