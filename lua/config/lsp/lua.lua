local lspconfig = require("lspconfig")
local base = require("config.lsp.base")

local settings = {
    Lua = {
        diagnostics = {
            globals = {
                "vim"
            },
        },
    },
}

-- configure lua_ls
lspconfig.lua_ls.setup({
    capabilities = base.capabilities,
    settings = base.merge_settings(base.settings, settings),
    on_attach = function(client, bufnr)
        base.on_attach(client, bufnr)
    end,
})
