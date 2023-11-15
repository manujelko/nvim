-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- enable mouse
vim.opt.mouse = 'a'

-- case sensitive search only with uppercase letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable search highlighting
vim.opt.hlsearch = false

-- wrap lines
vim.opt.wrap = true

-- preserve indentation of a virtual line
vim.opt.breakindent = true

-- amount of spaces a tab character occupies
vim.opt.tabstop = 4

-- amount of characters neovim will use to indent a line
vim.opt.shiftwidth = 4

-- should neovim transform tabs into spaces
vim.opt.expandtab = true

-- map leader to space
vim.g.mapleader = ' '

-- save file
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- copy to clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y')

-- paste from clipboard
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

-- delete without changing the register
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- select all the text in the current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- plugin manager
local lazy = {}

function lazy.install(path)
    if not vim.loop.fs_stat(path) then
        print('Installing lazy.nvim...')
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable', -- latest stable release
            path,
        })
    end
end

function lazy.setup(plugins)
    if vim.g.plugins_ready then
        return
    end

    -- You can "comment out" the line below after lazy.nvim is installed
    --lazy.install(lazy.path)

    vim.opt.rtp:prepend(lazy.path)

    require('lazy').setup(plugins, lazy.opts)
    vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
    -- list of plugins
    -- plenary
    {'nvim-lua/plenary.nvim'},
    -- color theme
    {'bluz71/vim-moonfly-colors'},
    -- status line
    {'nvim-lualine/lualine.nvim'},
    -- plugins for lsp
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- plugins for autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
    -- file explorer
    {'nvim-tree/nvim-tree.lua'},
    -- fuzzy finder
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    -- comments
    {'numToStr/Comment.nvim', lazy = false},
    -- treesitter
    {'nvim-treesitter/nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
})

-- color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('moonfly')

-- configure lualine
require('lualine').setup({
    options = {
        icons_enabled = false,
        theme = 'moonfly',
    }
})

-- reload config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- lsp
require('mason').setup()
require('mason-lspconfig').setup()
local lspconfig = require('lspconfig')
local lspconfig_configs = require('lspconfig.configs')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lua_ls
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                },
            },
        },
    },
    capabilities = lsp_capabilities,
})

-- pyright
lspconfig.pyright.setup({})

-- ruff-lsp
if not lspconfig_configs then
    lspconfig_configs.ruff_lsp = {
        default_config = {
            cmd = {'ruff-lsp'},
            filetypes = {'python'},
            root_dir = require('lspconfig').util.find_git_ancestor,
            init_options = {
                settings = {
                    args = {}
                }
            }
        }
    }
end
lspconfig.ruff_lsp.setup({})

-- lsp keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- displays hover information about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- jump to definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- list all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd"lua vim.lsp.buf.implementation()<cr>')

        -- jumps to the definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- lists all the references
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- displays a function's signature information
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- renames all references to the symbol under the cursor
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- selects a code action available at the current cursor position
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

        -- show diagnosticts in a floating window
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

        -- move to the previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

        -- move to the next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
})

-- snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- autocompletion
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    -- data sources to populate the completion list
    sources = {
        -- autocomplete file paths
        {name = 'path'},
        -- suggestions based on the language server
        {name = 'nvim_lsp', keyword_length = 1},
        -- suggest words found in the current buffer
        {name = 'buffer', keyword_length = 3},
        -- show available snippets
        {name = 'luasnip', keyword_length = 2},
    },
    -- appearance and settings for the documentation window
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        -- order of the elements in an item
        fields = {'menu', 'abbr', 'kind'},
        -- customize the appearance of the completion menu
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '‣',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    -- completion keybindings
    mapping = {
        -- confirm selection
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        -- cancel completion
        ['<C-e>'] = cmp.mapping.abort(),
        -- move between completion items
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        -- scroll text in the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- jump to the next placeholder in the snippet
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),
        -- jump to the previous placeholder in the snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
        -- autocomplete with tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
})

-- change diagnostics icons
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = '»'})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'awlays',
    },
})

-- help windows with borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'})

-- nvim-tree
require('nvim-tree').setup({
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            },
        },
    },
    hijack_cursor = false,
    on_attach = function(bufnr)
        local bufmap = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
        end

        local api = require('nvim-tree.api')

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

        bufmap('L', api.node.open.edit, 'Expand folder or go to file')
        bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
        bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- telescope
require('telescope').load_extension('fzf')
-- search opened files
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
-- search recently opened files
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
-- search files in the current working directory
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
-- search for a pattern in all files in the current working directory
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
-- search diagnostic messages: A diagnostic can be an error, a warnging or a hint
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
-- search for a pattern in the current file
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- comments
require('Comment').setup()

-- treesitter
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
        'c',
        'lua',
        'make',
        'markdown',
        'python',
        'vim',
        'vimdoc'
    },
})

-- format on save in Python
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.lsp.buf.format {async = true}
    end,
})

