local base = require("config.lsp.base")
local lspconfig = require("lspconfig")

-- configure gopls
lspconfig.gopls.setup({
    capabilities = base.capabilities,
    settings = base.settings,
    on_attach = function(client, bufnr)
        base.on_attach(client, bufnr)
        -- format and organize imports on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })
    end,
})
