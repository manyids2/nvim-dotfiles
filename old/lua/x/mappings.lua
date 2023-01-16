local _set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- save, quit, reload
_set("n", "<C-s>", ":w<CR>", opts)
_set("n", "<C-q>", ":q<CR>", opts)

_set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
_set("n", "<C-a>", ":Telescope file_browser<CR>", { noremap = true })
_set("n", "<C-x>", ":lclose<CR>", opts)

_set("n", "<leader>l", ":TZAtaraxis<CR>", opts)
-- _set("n", "<C-l>", ":TZNarrow<CR>", {})
_set("v", "<leader>l", ":'<,'>TZNarrow<CR>", opts)

_set("n", "<leader>gg", ":ARsyncUpDelete<CR>", opts)
_set("n", "<leader>gl", ":!/home/x/code/rsync/rsync.sh<CR>", { noremap = true, silent = false })

-- why not working??
-- _set("n", "<leader><C-x>", "gcip", opts)
_set("n", "<leader>c", ":call inyoface#toggle_comments()<CR>", opts)
vim.keymap.set('x', '<leader>c', require('osc52').copy_visual)

-- clear highlight
_set("n", "<C-,>", ":lua vim.lsp.buf.document_highlight()<CR>", opts)
_set("n", "<C-.>", ":noh<CR>:lua vim.lsp.buf.clear_references()<CR>", opts)

-- buffer movement
_set("n", "<leader>j", ":bn<CR>", opts)
_set("n", "<leader>k", ":bp<CR>", opts)
_set("n", "<leader>x", ":bd<CR>", opts)

-- window movement
_set("n", "<C-d>", [[<C-w>w]], opts)
_set("n", "<C-w>z", ":tabedit %<CR>", opts)

-- terminal movement
_set("t", "<C-d>", [[<C-\><C-n><C-w>w]], opts)

-- sessions
_set("n", "<leader><C-s>", ":SSave ", { noremap = true, silent = false })
_set("n", "<leader><C-l>", ":SLoad ", { noremap = true, silent = false })

-- format
_set("n", "<C-e>", ":lua vim.lsp.buf.format()<CR>", opts)

-- reload
_set("n", "<leader><C-q>", ':lua require("plenary.reload").reload_module("x")<CR>', opts)

_set("n", "<leader><C-j>", ":!cd docs/;make html;<CR>", opts)

-- custom
_set(
	"n",
	"<C-a><C-a>",
	":lua require'plenary.reload'.reload_module('journal-lsp')<CR>:lua require'journal-lsp'.setup()<CR>",
	opts
)
_set(
	"n",
	"<C-h><C-h>",
	":lua require'plenary.reload'.reload_module('pyhelp')<CR>:lua require'pyhelp'.setup()<CR>",
	opts
)

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
