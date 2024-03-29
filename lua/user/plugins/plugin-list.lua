local lazy = require('user.plugins.manager')

lazy.setup({
    -- list of plugins
    -- plenary
    { 'nvim-lua/plenary.nvim' },
    -- color theme
    { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
    -- status line
    { 'nvim-lualine/lualine.nvim' },
    -- plugins for lsp
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- plugins for autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    -- file explorer
    { 'nvim-tree/nvim-tree.lua' },
    -- fuzzy finder
    { 'nvim-telescope/telescope.nvim' },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    -- comments
    {
        'numToStr/Comment.nvim',
        lazy = false
    },
    -- treesitter
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    -- surround
    { 'tpope/vim-surround' },
    -- devicons
    { 'nvim-tree/nvim-web-devicons' },
    -- venv-selector
    {
        'linux-cultist/venv-selector.nvim',
        keys = {
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        }
    },
})
