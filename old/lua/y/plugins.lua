vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- essentials
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "ojroques/nvim-osc52" })

	-- tpope
	use("tpope/vim-repeat") -- Repeat actions better
	use("tpope/vim-surround") -- Surround text objects easily
	use("nelstrom/vim-visual-star-search")
	use("svermeulen/vim-cutlass")
	require("x.configs.cutlass")

	-- autopairs
	use({ "windwp/nvim-autopairs" })
	require("nvim-autopairs").setup()
	use({ "godlygeek/tabular" })

	-- fold string
	use({ "anuvyklack/pretty-fold.nvim" })
	use({ "anuvyklack/fold-preview.nvim", requires = "anuvyklack/keymap-amend.nvim" })
	require("fold-preview").setup()
	require("x.configs.prettyfold")

	-- comment
	use({ "numToStr/Comment.nvim" })
	require("x.configs.comment")
	use({ "tjdevries/vim-inyoface" })

	-- tree
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	require("x.configs.nvimtree")

	-- appearance
	use({ "marko-cerovac/material.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "mhartington/oceanic-next" })
	use({ "rafamadriz/neon" })
	use({ "shaunsingh/nord.nvim" })
	use({ "shaunsingh/seoul256.nvim" })
	use({ "sainnhe/edge" })
	use({ "sainnhe/everforest" })
	require("x.configs.tokyonight")

	use({ "rcarriga/nvim-notify" })
	require("notify").setup({
		timeout = 1000,
		stages = "fade_in_slide_out",
		background_colour = "#000000",
	})
	vim.notify = require("notify")

	-- fancy
	use({ "stevearc/dressing.nvim" })
	require("x.configs.dressing")

	use({ "norcalli/nvim-colorizer.lua" })
	require("colorizer").setup()

	use({ "chrisbra/unicode.vim" })

	-- tabline, bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	require("x.configs.bufferline")

	use({ "nvim-lualine/lualine.nvim" })
	require("x.lualines.bubbles")

	-- indent
	use({ "lukas-reineke/indent-blankline.nvim" })
	require("x.configs.indentblankline")

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
	-- use({ "nvim-telescope/telescope-smart-history.nvim" })
	require("x.telescope.mappings")
	require("x.telescope.setup")
	require("x.telescope.custom")

	-- splits
	use({ "mrjones2014/smart-splits.nvim" })
	require("x.configs.smartsplits")

	-- terminal
	use({ "akinsho/toggleterm.nvim" })
	require("x.configs.toggleterm")

	use({ "KenN7/vim-arsync" })
	use({ "edluffy/hologram.nvim" })
	require("hologram").setup({
		auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
	})

	-- -- lsp
	use({ "neovim/nvim-lspconfig" })

	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	require("mason").setup()
	require("mason-lspconfig").setup()

	require("y.lsp.masoncfg")
	require("y.lsp.nullls")

	use({ "onsails/lspkind-nvim" })
	require("x.cmp.setup")

	-- cmp
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/nvim-cmp" })

	-- Tree sitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	require("x.configs.tsplayground")
	require("x.treesitter.textobjects")
	require("x.treesitter.modules")

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	-- use({ "Ellogon/ixi-snips" })
	require("x.configs.snippets")

	-- git
	use({ "TimUntersberger/neogit" })
	require("x.configs.neogit")
	use({ "pwntester/octo.nvim" })
	require("x.configs.octo")

	-- use({ "sindrets/diffview.nvim" })
	-- require("x.configs.diffview")

	-- truezen
	use({ "Pocco81/TrueZen.nvim" })
	require("x.configs.truezen")

	-- journal
	use("/home/x/fd/code/journal-lsp")
end)
