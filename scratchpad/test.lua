---@diagnostic disable-next-line: lowercase-global
function reload_journal()
  RELOAD("journal-lsp")
  require("journal-lsp").setup()
end

vim.api.nvim_set_keymap("n", "<C-x>",
":lua reload_journal()<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<C-e>",
":lua require('journal-lsp').goto_link()<CR>", { silent = true })
