-- update leader key to ,
vim.g.mapleader = ","
-- setting line number
vim.opt.number = true
-- setting the floating value to classy color
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg="gray", ctermfg="white" })
-- setting up indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
