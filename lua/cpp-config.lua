-- Require LSP config which we can use to attach clangd
local lspconfig = require("lspconfig")
lspconfig.ccls.setup({})
