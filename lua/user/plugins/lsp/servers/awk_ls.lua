local common = require('user.plugins.lsp.setup')
local lspconfig = require('lspconfig')

-- awk_ls
lspconfig.awk_ls.setup({
    on_attach = common.on_attach,
    capabilities = common.capabilities,
})
