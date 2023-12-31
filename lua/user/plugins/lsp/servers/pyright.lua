local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

-- pyright
lspconfig.pyright.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
})
