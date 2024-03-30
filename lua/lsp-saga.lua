local map = vim.api.nvim_set_keymap

-- add your keymaps
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>Lspsaga term_toggle<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>ce", "<cmd>Lspsaga show_line_diagnostics<CR>", {})
