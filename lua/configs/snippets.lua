-- require("luasnip").log.set_loglevel("debug")
require("luasnip").setup({ history = false })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").load({ paths = { "/home/x/code/python-snippets" } })
