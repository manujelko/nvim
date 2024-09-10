require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
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
        "go",
        "gomod",
        "gosum",
        "gowork",
        "json",
        "python",
        "yaml",
    },
})
