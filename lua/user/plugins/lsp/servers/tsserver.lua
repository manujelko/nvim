local common = require('user.plugins.lsp.setup')
local lspconfig = require('lspconfig')

-- tsserver
lspconfig.tsserver.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
})
