require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "python", "bash" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = false,

	-- List of parsers to ignore installing (for "all")
	ignore_install = {},

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},

	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
	},

	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
