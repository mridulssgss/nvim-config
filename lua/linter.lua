require("lint").linters_by_ft = {
	lua = { "selene" },
	cpp = { "cpplint" },
	python = { "flakeheaven" },
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

-- setting up linter
require("lint").linters_by_ft = {
	markdown = { "vale" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
