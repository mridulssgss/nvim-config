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
	-- Configurations will go here soon
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
	 { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },

	-- Treesitter
	 {
		-- recommended packer way of installing it is to run this function, copied from documentation
		'nvim-treesitter/nvim-treesitter',
		build = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,

	},

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
	-- Adding lsp sage. See docs @ https://nvimdev.github.io
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
	   	 end,
	   	 dependencies = {
       		 	'nvim-treesitter/nvim-treesitter', -- optional
		 	'nvim-tree/nvim-web-devicons'     -- optional
		}
	}
}

opts = {}

require("lazy").setup(plugins, opts)
