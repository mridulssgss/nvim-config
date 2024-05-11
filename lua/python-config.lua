-- Require LSP config which we can use to attach clangd
local lspconfig = require("lspconfig")
-- Linter
lspconfig.pyright.setup({})
-- Lsp
lspconfig.pylsp.setup({})
