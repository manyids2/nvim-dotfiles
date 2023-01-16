vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local cmp = require("cmp")
local lspkind = require("lspkind")

local fn = vim.fn

local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local function tab(fallback)
	local luasnip = require("luasnip")
	if fn.pumvisible() == 1 then
		fn.feedkeys(t("<C-n>"), "n")
	elseif luasnip.expand_or_jumpable() then
		fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
	elseif check_back_space() then
		fn.feedkeys(t("<tab>"), "n")
	else
		fallback()
	end
end

local function shift_tab(fallback)
	local luasnip = require("luasnip")
	if fn.pumvisible() == 1 then
		fn.feedkeys(t("<C-p>"), "n")
	elseif luasnip.jumpable(-1) then
		fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
	else
		fallback()
	end
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
		updateevents = "TextChanged,TextChangedI",
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
		}),
	},

	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping(tab, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(shift_tab, { "i", "s" }),
		["<C-j>"] = cmp.mapping.scroll_docs(-4),
		["<C-k>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-f>"] = cmp.mapping.confirm({ select = true }),
	}),

	sources = cmp.config.sources({
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 3 },
		{ name = "path", keyword_length = 3 },
		{ name = "nvim_lsp", keyword_length = 3 },
		{ name = "nvim_lsp_signature_help", keyword_length = 3 },
		{ name = "nvim_lua", keyword_length = 3 },
	}),

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
		},
	},
})
