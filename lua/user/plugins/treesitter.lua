require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    },
    ensure_installed = {
        'bash',
        'css',
        'go',
        'gomod',
        'gosum',
        'html',
        'javascript',
        'json',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'proto',
        'python',
        'sql',
        'vim',
        'vimdoc',
        'yaml',
    },
})
