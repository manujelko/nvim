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
lspconfig.lua_ls.setup({
    on_attach = base.on_attach,
    capabilities = base.capabilities,
    settings = base.merge_settings(base.settings, settings),
})
