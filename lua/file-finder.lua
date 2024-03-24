-- Telescope plugins
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>', {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fl', builtin.lsp_references,{})

