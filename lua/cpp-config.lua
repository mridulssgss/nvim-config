-- Require LSP config which we can use to attach clangd 
local  lspconfig = require "lspconfig"
-- setting up clangd
lspconfig.clangd.setup {}


