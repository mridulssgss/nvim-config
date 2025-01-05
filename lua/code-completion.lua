-- completeopt is used to manage code suggestions
-- menuone: show popup even when there is only one suggestion
-- noinsert: Only insert text when selection is confirmed
-- noselect: force us to select one from the suggestions
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true }
local cmp = require("cmp")
vim.g.nvlime_config = {
	cmp = { enabled = true },
}
cmp.setup({

	mapping = {
		-- Shift+TAB to go to the Previous Suggested item
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		-- Tab to go to the next suggestion
		["<Tab>"] = cmp.mapping.select_next_item(),
		-- CTRL+SHIFT+f to scroll backwards in description
		["<C-F"] = cmp.mapping.scroll_docs(-4),
		-- CTRL+F to scroll forwards in the description
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- CTRL+SPACE to bring up completion at current Cursor location
		["<C-Space>"] = cmp.mapping.complete(),
		-- CTRL+e to exit suggestion and close it
		["<C-e>"] = cmp.mapping.close(),
		-- CR (enter or return) to CONFIRM the currently selection suggestion
		-- We set the ConfirmBehavior to insert the Selected suggestion
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	-- sources are the installed sources that can be used for code suggestions
	sources = {
		{ name = "nvlime-1", keyword_length = 1 },
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua", keyword_length = 1 },
		{ name = "buffer", keyword_length = 1 },
		{ name = "vsnip", keyword_length = 1 },
	},
	-- Add borders to the windows
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	-- add formating of the different sources
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				["nvlime-1"] = "%",
				nvim_lsp = "λ",
				nvim_lua = "l",
				vsnip = "⋗",
				buffer = "b",
				path = "p",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
