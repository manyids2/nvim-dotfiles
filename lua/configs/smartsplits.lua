require("smart-splits").setup({
	-- Ignored filetypes (only while resizing)
	ignored_filetypes = {
		"nofile",
		"quickfix",
		"prompt",
	},
	-- Ignored buffer types (only while resizing)
	ignored_buftypes = { "NvimTree" },
	-- the default number of lines/columns to resize by at a time
	default_amount = 3,
	-- when moving cursor between splits left or right,
	-- place the cursor on the same row of the *screen*
	-- regardless of line numbers. False by default.
	-- Can be overridden via function parameter, see Usage.
	move_cursor_same_row = false,
	-- resize mode options
	resize_mode = {
		-- key to exit persistent resize mode
		quit_key = "<ESC>",
		-- keys to use for moving in resize mode
		-- in order of left, down, up' right
		resize_keys = { "h", "j", "k", "l" },
		-- set to true to silence the notifications
		-- when entering/exiting persistent resize mode
		silent = false,
		-- must be functions, they will be executed when
		-- entering or exiting the resize mode
		hooks = {
			on_enter = nil,
			on_leave = nil,
		},
	},
	-- ignore these autocmd events (via :h eventignore) while processing
	-- smart-splits.nvim computations, which involve visiting different
	-- buffers and windows. These events will be ignored during processing,
	-- and un-ignored on completed. This only applies to resize events,
	-- not cursor movement events.
	ignored_events = {
		"BufEnter",
		"WinEnter",
	},
	-- enable or disable the tmux integration
	tmux_integration = true,
})

-- resizing splits
vim.keymap.set("n", "<M-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<M-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<M-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<M-l>", require("smart-splits").resize_right)

-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
