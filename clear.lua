vim.opt.runtimepath:remove(vim.fn.expand('~/.config/nvim'))
vim.opt.packpath:remove(vim.fn.expand('~/.local/share/nvim/site'))

vim.opt.runtimepath:append(vim.fn.expand('~/.config/nvim'))
vim.opt.packpath:append(vim.fn.expand('~/.local/share/nvim/site'))

-- Share some options across different 'profiles'
vim.g.python3_host_prog = "/home/x/code/immunogon/ellogon.env/bin/python3"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Load the 'profile'
require("x")
