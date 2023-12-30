local common = require('user.plugins.lsp.setup')
local lspconfig = require('lspconfig')

-- pyright
lspconfig.pyright.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
})
