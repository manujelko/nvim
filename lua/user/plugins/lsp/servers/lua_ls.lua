local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                },
            },
        },
    },
})

