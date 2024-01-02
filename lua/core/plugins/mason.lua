require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	},
	ensure_installed = {
		"gopls",
		"pyright",
		"mypy",
		"ruff",
		"black",
		"debugpy",
	}
})
