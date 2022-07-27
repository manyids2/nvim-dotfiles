local _set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- save, quit, reload
_set("n", "<C-s>", ":w<CR>", opts)
_set("n", "<C-q>", ":q<CR>", opts)

_set("n", "<C-n>", ':NvimTreeToggle<CR>', opts)
_set("n", "<C-l>", ':TZAtaraxis<CR>', opts)

-- rsync
_set("n", "<leader>gg", ':ARsyncUp<CR>', opts)

-- clear highlight
_set("n", "<leader><leader>", ":noh<CR>", opts)
_set("n", "<C-,>", ":lua vim.lsp.buf.document_highlight()<CR>", opts)
_set("n", "<C-.>", ":lua vim.lsp.buf.clear_references()<CR>", opts)

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

-- symbols
_set("n", "gS", ":SymbolsOutline<CR>", { noremap = true, silent = true })

-- themes
-- _set("n", "<leader>lll", ":set background=light<CR>", opts)
-- _set("n", "<leader>ddd", ":set background=dark<CR>", opts)

-- reload
_set("n", "<leader><C-q>", ':lua require("plenary.reload").reload_module("x")<CR>', opts)

-- telekasten
_set("n", "<leader>z", ":lua require('telekasten').panel()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zf", ":lua require('telekasten').find_notes()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zd", ":lua require('telekasten').find_daily_notes()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zg", ":lua require('telekasten').search_notes()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zz", ":lua require('telekasten').follow_link()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zj", ":lua require('telekasten').goto_today()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zk", ":lua require('telekasten').goto_thisweek()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zz", ":lua require('telekasten').follow_link()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zn", ":lua require('telekasten').new_note()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<CR>", { noremap = true, silent = false })
_set("n", "<leader>zc", ":lua require('telekasten').show_calendar()<CR>", { noremap = true, silent = false })
