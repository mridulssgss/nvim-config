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
    -- Package manager
	 'williamboman/mason.nvim',
	 'williamboman/mason-lspconfig.nvim',
	 'neovim/nvim-lspconfig',
	-- Hrsh7th Code Completion Suite
	 'hrsh7th/nvim-cmp',
	 'hrsh7th/cmp-nvim-lsp',
	 'hrsh7th/cmp-nvim-lua',
	 'hrsh7th/cmp-nvim-lsp-signature-help',
	 'hrsh7th/cmp-vsnip',
	 'hrsh7th/cmp-path',                             
	 'hrsh7th/cmp-buffer',
	 'hrsh7th/vim-vsnip',
	-- vim-illuminate
	 'RRethy/vim-illuminate',
	-- 
	-- File explorer tree
	 {
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	},
	-- DAP for debugging
	 'mfussenegger/nvim-dap',
	-- UI for DAP
	 { "rcarriga/nvim-dap-ui", dependencies = 
	 	{
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		} 
	},

	-- Adding nvim tree-sitter. See docs: https://github.com/nvim-treesitter/nvim-treesitter/
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	-- Telescope d to fuzzy search files
	 {
		'nvim-telescope/telescope.nvim', version = '0.1.3',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	-- adding ability to selected autopairs see https://github.com/windwp/nvim-autopairs?tab=readme-ov-file for docs
	 {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	-- Adding status bar. see docs: https://github.com/nvim-lualine/lualine.nvim 
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Setting up gitsigns for git decoration and git blame. See docs: https://github.com/lewis6991/gitsigns.nvim
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                    untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            },
        })
    end,
    },
	-- Add lsp-saga for ide like features. See docs: https://nvimdev.github.io/lspsaga/
 	{
             	'nvimdev/lspsaga.nvim',
    		config = function()
        		require('lspsaga').setup({
				lightbulb = {
					sign = false
				}
			})
    		end,
    		dependencies = {
        		'nvim-treesitter/nvim-treesitter', -- optional
        		'nvim-tree/nvim-web-devicons'     -- optional
    		}
	}
}

opts = {}

require("lazy").setup(plugins, opts)

