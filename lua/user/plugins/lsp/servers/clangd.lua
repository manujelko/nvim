local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    filetypes = { 'c', 'cpp', 'h' }
})
