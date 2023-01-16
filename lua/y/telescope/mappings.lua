local _set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Files
_set("n", "<leader>ff", ":Telescope find_files theme=dropdown<CR>", opts)
_set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
_set("n", "<leader>fh", ":Telescope oldfiles theme=dropdown<CR>", opts)
-- _set("n", "<leader>fm", ":Telescope marks theme=dropdown<CR>", opts)

_set("n", "<C-b>", ":Telescope buffers theme=dropdown<CR>", opts)
-- _set("n", "<C-m>", ":Telescope marks theme=dropdown<CR>", opts)
