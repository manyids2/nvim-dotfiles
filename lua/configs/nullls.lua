require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.shfmt,
		require("null-ls").builtins.formatting.stylelint,
		require("null-ls").builtins.formatting.prettierd,
		-- require("null-ls").builtins.formatting.mdformat,
	},
})
