local DEFAULT_SETTINGS = {
	PATH = "prepend",
	pip = {
		upgrade_pip = false,
		install_args = {},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
	github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
	providers = {
		"mason.providers.registry-api",
	},
	ui = {
		check_outdated_packages_on_open = true,
		border = "none",
		width = 0.8,
		height = 0.9,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "◍",
		},
		keymaps = {
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			update_all_packages = "U",
			check_outdated_packages = "C",
			uninstall_package = "X",
			cancel_installation = "<C-c>",
			apply_language_filter = "<C-f>",
		},
	},
}

require("mason").setup(DEFAULT_SETTINGS)
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua" },
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
