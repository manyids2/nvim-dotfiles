vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- essentials
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "lewis6991/impatient.nvim" })

	-- tpope
	use("tpope/vim-repeat") -- Repeat actions better
	use("tpope/vim-surround") -- Surround text objects easily
	use("nelstrom/vim-visual-star-search")
	use("svermeulen/vim-cutlass")
	require("configs.cutlass")

	-- autopairs
	use({ "windwp/nvim-autopairs" })
	require("nvim-autopairs").setup()

	-- fold string
	use({ "anuvyklack/pretty-fold.nvim" })
	use({ "anuvyklack/fold-preview.nvim", requires = "anuvyklack/keymap-amend.nvim" })
	require("fold-preview").setup()
	require("configs.prettyfold")

	-- comment
	use({ "numToStr/Comment.nvim" })
	require("Comment").setup()

	-- tree
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	require("configs.nvimtree")

	-- appearance
	use({ "marko-cerovac/material.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "mhartington/oceanic-next" })
	use({ "rafamadriz/neon" })
	use({ "shaunsingh/nord.nvim" })
	use({ "shaunsingh/seoul256.nvim" })
	use({ "sainnhe/edge" })

	-- fancy
	use({ "rcarriga/nvim-notify" })
	require("notify").setup({
		timeout = 1000,
		stages = "fade_in_slide_out",
	})
	vim.notify = require("notify")

	use({ "stevearc/dressing.nvim" })
	require("configs.dressing")

	-- tabline, bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	require("configs.bufferline")

	use({ "nvim-lualine/lualine.nvim" })
	require("configs.lualines")

	-- indent
	use({ "lukas-reineke/indent-blankline.nvim" })
	-- require("configs.indentblankline")

	-- dashboard
	use({ "mhinz/vim-startify" })

	-- telescope
	use({ "junegunn/fzf", run = "./install --all" })
	use({ "junegunn/fzf.vim" })
	use({ "tami5/sqlite.lua" })

	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-hop.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-telescope/telescope-smart-history.nvim" })
	require("y.telescope.mappings")
	require("y.telescope.setup")

	-- terminal
	use({ "akinsho/toggleterm.nvim" })
	require("configs.toggleterm")

	-- cmp
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/nvim-cmp" })

	-- !! NOTE !! needs lsp-kind first
	use({ "onsails/lspkind-nvim" })
	require("configs.cmp")

	-- lsp
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	require("configs.mason")
	require("configs.lsp")

	-- formatting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	require("configs.nullls")

	-- Tree sitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	require("configs.treesitter")
	require("configs.tsplayground")

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	require("configs.snippets")

	-- truezen
	use({ "Pocco81/TrueZen.nvim" })
	require("configs.truezen")

	-- git
	use({ "TimUntersberger/neogit" })
	require("configs.neogit")
	use({ "pwntester/octo.nvim" })
	require("configs.octo")

  -- diary
	use("~/fd/code/journal-lsp")
	require("journal-lsp").setup()

end)
