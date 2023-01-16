local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_layout = require("telescope.actions.layout")

local set_prompt_to_entry_value = function(prompt_bufnr)
	local entry = action_state.get_selected_entry()
	if not entry or not type(entry) == "table" then
		return
	end

	action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

require("telescope").setup({
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		multi_icon = "<>",

		winblend = 0,

		layout_strategy = "horizontal",
		layout_config = {
			width = 0.95,
			height = 0.85,
			prompt_position = "bottom",

			horizontal = {
				preview_width = function(_, cols, _)
					return math.floor(cols * 0.6)
				end,
			},

			vertical = {
				width = 0.9,
				height = 0.95,
				preview_height = 0.5,
			},

			flex = {
				horizontal = {
					preview_width = 0.9,
				},
			},
		},

		selection_strategy = "reset",
		sorting_strategy = "ascending",
		scroll_strategy = "cycle",
		color_devicons = true,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-s>"] = actions.select_horizontal,
				["<C-n>"] = "move_selection_next",

				["<C-y>"] = set_prompt_to_entry_value,

				-- These are new :)
				["<M-p>"] = action_layout.toggle_preview,
				["<M-m>"] = action_layout.toggle_mirror,

				-- This is nicer when used with smart-history plugin.
				["<C-k>"] = actions.cycle_history_next,
				["<C-j>"] = actions.cycle_history_prev,
				["<c-g>s"] = actions.select_all,
				["<c-g>a"] = actions.add_selection,

				["<c-space>"] = function(prompt_bufnr)
					local opts = {
						callback = actions.toggle_selection,
						loop_callback = actions.send_selected_to_qflist,
					}
					require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
				end,

				["<C-w>"] = function()
					vim.api.nvim_input("<c-s-w>")
				end,
			},
		},

		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		-- file_ignore_patterns = nil,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
	},

	pickers = {
		-- find_files = {
		--   sorter = require("telescope.sorters").get_levenshtein_sorter(),
		-- },
		fd = {
			mappings = {
				n = {
					["kj"] = "close",
				},
			},
		},

		git_branches = {
			mappings = {
				i = {
					["<C-a>"] = false,
				},
			},
		},
	},

	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = false,
		},

		fzf_writer = {
			use_highlighter = false,
			minimum_grep_characters = 6,
		},
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		hop = {
			-- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
			keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

			-- Highlight groups to link to signs and lines; the below configuration refers to demo
			-- sign_hl typically only defines foreground to possibly be combined with line_hl
			sign_hl = { "WarningMsg", "Title" },

			-- optional, typically a table of two highlight groups that are alternated between
			line_hl = { "CursorLine", "Normal" },

			-- options specific to `hop_loop`
			-- true temporarily disables Telescope selection highlighting
			clear_selection_hl = false,
			-- highlight hopped to entry with telescope selection highlight
			-- note: mutually exclusive with `clear_selection_hl`
			trace_entry = true,
			-- jump to entry where hoop loop was started from
			reset_selection = true,
		},
	},
})

-- _ = require("telescope").load_extension "dap"
-- _ = require("telescope").load_extension "notify"
-- _ = require("telescope").load_extension "neoclip"
_ = require("telescope").load_extension("fzf")
_ = require("telescope").load_extension("file_browser")
_ = require("telescope").load_extension("ui-select")
-- _ = require("telescope").load_extension "smart_history"

if vim.fn.executable("gh") == 1 then
	pcall(require("telescope").load_extension, "gh")
	pcall(require("telescope").load_extension, "octo")
end