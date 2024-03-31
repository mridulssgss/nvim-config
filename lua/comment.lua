require("Comment").setup({
	mappings = {
		basic = true,
		extra = true,
		extended = true,
	},
	toggler = {
		-- <C-_> is equals to <C-/>
		line = "<C-_>",
		block = "gB",
	},
	opleader = {
		line = "<C-_>",
		block = "gCC",
	},
	pre_hook = nil,
	post_hook = nil,
})
