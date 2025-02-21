local base = require("config.lsp.base")
local lspconfig = require("lspconfig")

-- configure cssls
lspconfig.cssls.setup({
	capabilities = base.capabilities,
	settings = base.settings,
	on_attach = function(client, bufnr)
		base.on_attach(client, bufnr)
	end,
})
