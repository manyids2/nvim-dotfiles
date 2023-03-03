require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.presenter"] = {
			config = {
				zen_mode = "truezen",
			},
		},
		["core.norg.concealer"] = {},
		-- completion
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
				name = "",
			},
		},
		-- basics
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
		-- journal
		["core.norg.journal"] = {
			config = {
				strategy = "flat",
				journal_folder = "journal",
				workspace = "notes",
			},
		},
		-- telescope
		["core.integrations.telescope"] = {},
	},
})
