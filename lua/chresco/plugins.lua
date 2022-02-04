vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	use 'wbthomason/packer.nvim'
	use 'sainnhe/gruvbox-material'
	use ({ "kyazdani42/nvim-web-devicons" })
	use({
		"nvim-lualine/lualine.nvim",
	
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"windwp/nvim-autopairs",
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip-integ" },
			{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
		},
	})

 	use "kyazdani42/nvim-tree.lua"

	use 'neovim/nvim-lspconfig'

	use "jose-elias-alvarez/null-ls.nvim"

	use({
		"nvim-telescope/telescope.nvim",
		module = "telescope",
		cmd = "Telescope",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "onsails/lspkind-nvim" })

	use {
		'williamboman/nvim-lsp-installer',
	}

	use 'glepnir/dashboard-nvim'

	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

	use 'alvan/vim-closetag'

	use 'glepnir/lspsaga.nvim'
	use 'liuchengxu/vim-clap' 

	use 'glepnir/indent-guides.nvim'

end)

