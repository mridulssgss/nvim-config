local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	-- themes
	"EdenEast/nightfox.nvim",
	-- {
	--		"folke/tokyonight.nvim",
	--		lazy = false,
	--		priority = 1000,
	--		opts = {},
	--	},
	-- Package manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	-- Hrsh7th Code Completion Suite
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/vim-vsnip",
	-- setting up plugin manager
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	-- setting up lint
	"mfussenegger/nvim-lint",
	-- vim-illuminate
	"RRethy/vim-illuminate",
	-- Adding dap adapter
	"mfussenegger/nvim-dap",
	-- File explorer tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	-- DAP for debugging
	"jbyuki/one-small-step-for-vimkind",
	-- UI for DAP
	{ "rcarriga/nvim-dap-ui", dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	} },

	-- Adding nvim tree-sitter. See docs: https://github.com/nvim-treesitter/nvim-treesitter/
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- Telescope d to fuzzy search files
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- adding ability to selected autopairs see https://github.com/windwp/nvim-autopairs?tab=readme-ov-file for docs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- Adding status bar. see docs: https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Setting up gitsigns for git decoration and git blame. See docs: https://github.com/lewis6991/gitsigns.nvim
	"lewis6991/gitsigns.nvim",
	-- Add lsp-saga for ide like features. See docs: https://nvimdev.github.io/lspsaga/
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
					sign = false,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- Adding support for test
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- Adding support for formatter
	"stevearc/conform.nvim",
	-- Adding support for quick comment
	"numToStr/Comment.nvim",
	-- Adding support for ast-grep
	-- "Marskey/telescope-sg",
	-- Adding support for markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	--	"alex-laycalvert/flashcards.nvim",
	{
		"monkoose/nvlime",
		dependencies = { "monkoose/parsley" },
		nvlime_config = {
			cmp = { enabled = true },
		},
	},
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },
	"gpanders/nvim-parinfer",
}

opts = {}

require("lazy").setup(plugins, opts)
