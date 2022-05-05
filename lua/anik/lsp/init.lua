local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "anik.lsp.lsp-installer"
require("anik.lsp.handlers").setup()
require "anik.lsp.null-ls"
