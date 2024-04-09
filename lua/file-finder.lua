-- integrating with ast-grep
-- require("telescope").setup({
-- 	extensions = {
-- 		ast_grep = {
-- 			command = {
-- 				"ast-grep",
-- 				"--json=stream",
-- 			},
-- 			grep_open_files = false,
-- 			lang = nil,
-- 		},
-- 	},
-- })
--
-- require("telescope").load_extension("ast_grep")
-- Telescope plugins

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fx", '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>', {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
vim.keymap.set("n", "<leader>fl", builtin.lsp_references, {})
