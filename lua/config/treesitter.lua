require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	ensure_installed = {
		"css",
		"html",
		"ini",
		"javascript",
		"json",
		"python",
		"sql",
		"tsx",
		"typescript",
		"yaml",
	},
})
