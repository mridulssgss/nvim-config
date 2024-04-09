require("lint").linters_by_ft = {
	lua = { "selene" },
	cpp = { "cpplint" },
	c = { "cpplint" },
	python = { "flakeheaven" },
	markdown = { "markdownlint" },
}
vim.api.nvim_exec(
	[[
  augroup Lint
    autocmd!
    autocmd BufWritePost *.lua lua require('lint').try_lint()
  augroup END
]],
	true
)

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
