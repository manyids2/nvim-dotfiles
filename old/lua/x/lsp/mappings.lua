local _set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

_set("n", "<C-e>", ":lua vim.lsp.buf.format()<CR>", opts)

_set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
