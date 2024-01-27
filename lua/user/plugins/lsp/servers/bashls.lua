local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

lspconfig.bashls.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
})
