require("lint").linters_by_ft = {
	lua = { "selene" },
	cpp = { "cppcheck" },
	c = { "cppcheck" },
	python = { "pylint", "mypy" },
	markdown = { "markdownlint" },
	make = { "checkmake" },
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
