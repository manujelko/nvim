local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

lspconfig.sqls.setup({
    on_attach = function(client, bufnr)
        common.on_attach(client, bufnr)
    end,
    capabilities = common.capabilities,
})
