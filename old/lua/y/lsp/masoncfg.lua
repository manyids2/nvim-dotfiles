local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
	vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
	return
end

-- Extension to bridge mason.nvim with the lspconfig plugin
mason_lspconfig.setup({
	-- A list of servers to automatically install if they're not already installed.
	ensure_installed = {
		"clangd",
		"rstcheck",
		"bashls",
		"cmake-language-servere",
		"css-lsp",
		"html-lsp",
		"json-lsp",
		"lua-language-server",
		"bash-language-server",
		"pyright",
		"ltex-ls",
		"vim-language-server",
		"yaml-language-server",
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
	return
end

local on_attach = function(_, bufnr)
	local function bufopt(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	bufopt("omnifunc", "v:lua.vim.lsp.omnifunc")

	local _set = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	_set(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	_set(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	_set(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	_set(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	_set(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	_set(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	_set(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	_set(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	_set(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	_set(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

	_set(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	_set(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	-- _set(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	-- _set(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	-- _set(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	-- _set(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	-- _set(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
	on_attach = on_attach,
	capabilities = capabilities,
}

mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- Default handler (optional)
		lspconfig[server_name].setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,

	-- Next, you can provide targeted overrides for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["pyright"] = function()
		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["marksman"] = function()
		lspconfig.marksman.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["bashls"] = function()
		lspconfig.bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	-- ["rstcheck"] = function()
	-- 	lspconfig.bashls.setup({
	-- 		on_attach = on_attach,
	-- 		capabilities = capabilities,
	-- 	})
	-- end,
	["tsserver"] = function()
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["yamlls"] = function()
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "use" },
					},
				},
			},
		})
	end,
})

-- vim.diagnostic.setloclist({ open = false })
-- vim.api.nvim_create_augroup('diagnostics', { clear = true })
-- vim.api.nvim_create_autocmd('DiagnosticChanged', {
--   group = 'diagnostics',
--   callback = function()
--     vim.diagnostic.setloclist({ open = false })
--   end,
-- })
