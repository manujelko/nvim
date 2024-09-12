local base = require("config.lsp.base")
local lspconfig = require("lspconfig")

-- configure ts_ls
lspconfig.ts_ls.setup({
    capabilities = base.capabiltiies,
    settings = base.settings,
    on_attach = function(client, bufnr)
        base.on_attach(client, bufnr)
    end,
})
