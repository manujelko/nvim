vim.g.python_indent = {}         -- Disable built-in Vim Python indent
vim.g.python_indent_disabled = 1 -- Ensure old indenting is off

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python" }
	},
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
		"bash",
		"css",
		"html",
		"ini",
		"javascript",
		"json",
		"kdl",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"sql",
		"toml",
		"yaml",
	},
})
