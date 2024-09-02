local base = require("config.lsp.base")
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = base.on_attach,
  capabilities = base.capabiltiies,
  settings = base.settings,
})

lspconfig.ruff.setup({
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  settings = base.settings,
})
