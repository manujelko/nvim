local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
        common.on_attach(client, bufnr)
        -- add formatting on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ timeout_ms = 2000 })
            end,
        })
    end,
    capabilities = common.capabilities,
})
