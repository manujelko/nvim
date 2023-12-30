local common = require('user.plugins.lsp.setup')
local lspconfig = require('lspconfig')

-- lua_ls
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

