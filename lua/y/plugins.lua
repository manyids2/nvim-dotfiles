vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- essentials
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "lewis6991/impatient.nvim" })

	-- Tree sitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	require("configs.tsplayground")
	require("configs.treesitter")

	-- splits
	use({ "mrjones2014/smart-splits.nvim" })
	require("configs.smartsplits")

	-- tpope
	use("tpope/vim-repeat") -- Repeat actions better
	use("tpope/vim-surround") -- Surround text objects easily
	use("nelstrom/vim-visual-star-search")
	use("svermeulen/vim-cutlass")
	require("configs.cutlass")

	-- autopairs
	use({ "windwp/nvim-autopairs" })
	require("nvim-autopairs").setup()

	-- formatting
	use({ "godlygeek/tabular" })
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	require("configs.ufo")

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
	require("configs.tokyonight")

	-- fancy
	use({ "rcarriga/nvim-notify" })
	require("notify").setup({
		timeout = 1000,
		stages = "fade_in_slide_out",
	})
	vim.notify = require("notify")

	use({ "stevearc/dressing.nvim" })
	require("configs.dressing")

	use({ "edluffy/hologram.nvim" })
	require("hologram").setup({
		auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
	})

	use({ "chrisbra/unicode.vim" })

	-- tabline, bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	require("configs.bufferline")

	use({ "nvim-lualine/lualine.nvim" })
	require("configs.lualines")

	-- indent
	use({ "lukas-reineke/indent-blankline.nvim" })
	require("configs.indentblankline")

	-- dashboard
	use({ "mhinz/vim-startify" })

	-- clipboard
	use({ "AckslD/nvim-neoclip.lua" })
	require("configs.neoclip")

	-- telescope
	use({ "junegunn/fzf", run = "./install --all" })
	use({ "junegunn/fzf.vim" })
	use({ "kkharji/sqlite.lua" })

	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-hop.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-telescope/telescope-smart-history.nvim" })
	use({ "axkirillov/easypick.nvim" })
	require("y.telescope.mappings")
	require("y.telescope.setup")
	require("y.telescope.easypick")

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

	use({ "danymat/neogen" })
	require("configs.neogen")

	-- lsp-symbols
	use("simrat39/symbols-outline.nvim")
	require("configs.symbolsoutline")

	-- formatting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	require("configs.nullls")

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	require("configs.snippets")

	-- truezen
	use({ "Pocco81/TrueZen.nvim" })
	require("configs.truezen")

	-- rsync
	use({ "KenN7/vim-arsync" })

	-- git
	use({ "TimUntersberger/neogit" })
	require("configs.neogit")

	use({ "pwntester/octo.nvim" })
	require("configs.octo")

	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-unimpaired" })
	use({ "lewis6991/gitsigns.nvim" })
	require("configs.gitsigns")

	-- neorg
	use({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
	})
	require("configs.neorg")

	-- diary
	use("~/fd/code/journal-lsp")
	require("journal-lsp").setup()
end)
