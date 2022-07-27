vim.cmd([[packadd packer.nvim]])


return require('packer').startup(
  function()

    -- essentials
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "lewis6991/impatient.nvim" }

    -- tpope
    use "tpope/vim-repeat" -- Repeat actions better
    use "tpope/vim-surround" -- Surround text objects easily
    use "nelstrom/vim-visual-star-search"
    use "svermeulen/vim-cutlass"
    require 'x.configs.cutlass'

    use { 'sbdchd/neoformat' }

    -- autopairs
    use { "windwp/nvim-autopairs" }
    require('nvim-autopairs').setup()

    use "godlygeek/tabular" -- Quickly align text by pattern

    -- comment
    use { 'numToStr/Comment.nvim' }
    require('Comment').setup()

    -- tree
    use { "kyazdani42/nvim-web-devicons" }
    use { "kyazdani42/nvim-tree.lua" }
    require 'x.configs.nvimtree'

    -- rsync
    use { "kenn7/vim-arsync" }

    -- appearance
    use { "marko-cerovac/material.nvim" }
    use { "folke/tokyonight.nvim" }
    use { "mhartington/oceanic-next" }
    use { "rafamadriz/neon" }
    use { "shaunsingh/nord.nvim" }
    use { "shaunsingh/seoul256.nvim" }
    use { "sainnhe/edge" }

    -- tabline, bufferline
    use { "akinsho/bufferline.nvim", tag = "v2.*" }
    require 'x.configs.bufferline'

    use { "nvim-lualine/lualine.nvim" }
    require 'x.lualines.bubbles'

    -- use { "feline-nvim/feline.nvim" }
    -- require 'x.configs.feline'

    use { "lukas-reineke/indent-blankline.nvim" }
    require "x.configs.indentguides"

    -- dashboard
    -- use { "goolord/alpha-nvim" }
    -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    use { "mhinz/vim-startify" }
    vim.g.startify_change_to_dir = 0
    vim.g.startify_change_to_vcs_root = 0

    -- telescope
    use { "junegunn/fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }
    use { "tami5/sqlite.lua" }

    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-hop.nvim" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-smart-history.nvim" }
    require 'x.telescope.mappings'
    require 'x.telescope.setup'

    -- markdown
    use({ "iamcco/markdown-preview.nvim",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown", "telekasten" }
      end,
      ft = { "markdown", "telekasten" },
      run = function() vim.fn['mkdp#util#install']() end })

    -- Marks
    use { 'chentoast/marks.nvim' }
    require "x.configs.marks"

    -- terminal
    -- use { "akinsho/toggleterm.nvim" }
    -- require 'x.configs.toggleterm'

    -- cmp
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/nvim-cmp" }

    -- lsp
    use { "williamboman/nvim-lsp-installer" }
    use { "neovim/nvim-lspconfig" }
    use { "onsails/lspkind-nvim" }
    use { 'simrat39/symbols-outline.nvim' }
    require 'x.lsp.symbols'
    require 'x.lsp.config'
    require 'x.lsp.setup'
    require 'x.cmp.setup'

    -- Tree sitter
    use { "nvim-treesitter/nvim-treesitter" }
    require 'x.configs.treesitter'

    -- snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }
    require 'x.configs.snippets'

    -- truezen
    use { "Pocco81/TrueZen.nvim" }
    require 'x.configs.truezen'

    -- telekasten
    use { "renerocksai/telekasten.nvim" }
    use { "renerocksai/calendar-vim" }
    require 'x.configs.telekasten'

    -- Git
    use "TimUntersberger/neogit"
    use "lewis6991/gitsigns.nvim"
    require('gitsigns').setup()

    use { 'pwntester/octo.nvim' }
    require "x.configs.octo"

  end
)
