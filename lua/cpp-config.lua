-- Require LSP config which we can use to attach clangd
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
lspconfig.ccls.setup({})
