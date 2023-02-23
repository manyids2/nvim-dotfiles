local _set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- save, quit, reload
_set("n", "<C-s>", ":w<CR>", opts)
_set("n", "<C-q>", ":q<CR>", opts)

_set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
_set("n", "<C-a>", ":Telescope file_browser<CR>", { noremap = true })
_set("n", "<C-x>", ":lclose<CR>", opts)

_set("n", "<leader>s", ":SymbolsOutline<CR>", opts)
_set("n", "<leader>l", ":TZAtaraxis<CR>", opts)
_set("v", "<leader>l", ":'<,'>TZNarrow<CR>", opts)

_set("n", "<leader>gg", ":ARsyncUpDelete<CR>", opts)
_set("n", "<leader>gl", ":!/home/x/code/rsync/rsync.sh<CR>", { noremap = true, silent = false })

_set("n", "<leader>dd", ":!cd docs;make html;<CR>", opts)

_set("n", "<leader>rr", ":SLoad rsync<CR>", { noremap = true, silent = false })

-- clear highlight
_set("n", "<leader>,", ":lua vim.lsp.buf.document_highlight()<CR>", opts)
_set("n", "<leader>.", ":noh<CR>:lua vim.lsp.buf.clear_references()<CR>", opts)

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
