local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    on_attach = function(client, bufnr)
        common.on_attach(client, bufnr)
        -- add formatting on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ timeout_ms = 2000 })
                -- Schedule diagnostics refresh after a short delay
                vim.defer_fn(function()
                    vim.diagnostic.show()
                end, 100)
            end,
        })
    end,
    capabilities = common.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                },
            },
        },
    },
})
