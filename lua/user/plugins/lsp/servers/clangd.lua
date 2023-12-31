local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

-- clangd
lspconfig.clangd.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    filetypes = { "c" }
})
