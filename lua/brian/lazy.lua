local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stabel release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--colorscheme = catpuccin
	{
		"catppuccin/nvim", 
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},

	-- telescope plugin
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" }
	},	
	-- tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{
		"nvim-treesitter/playground"
	},
	{
		"nvim-lua/plenary.nvim"
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {"nvim-lua/plenary.nvim"}
	},
	{
		"mbbill/undotree"
	},
	{
		"tpope/vim-fugitive"
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP support
			"neovim/nvim-lspconfig",
			"WilliamBoman/mason.nvim",
			"WilliamBoman/mason-lspconfig.nvim",

			--Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",

			--snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
		}
	}
})
