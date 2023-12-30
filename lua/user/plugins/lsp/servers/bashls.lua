local common = require('user.plugins.lsp.setup')
local lspconfig = require('lspconfig')

-- bashls
lspconfig.bashls.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
})
