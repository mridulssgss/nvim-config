require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "autoflake", "autopep8" },
		-- Use a sub-list to run only the first available formatter
		-- javascript = { { "prettierd", "prettier" } },
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gci", "golines", "gofumpt" },
		json = { "fixjson" },
		yaml = { "yamlfix" },
		rust = { "rustfmt" },
		ocaml = { "ocamlformat" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
