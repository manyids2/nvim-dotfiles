require("luasnip.loaders.from_vscode").load({ include = { "python" } }) -- Load only python snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/x/code/ixi-snips" } })
require("luasnip.loaders.from_vscode").lazy_load()
