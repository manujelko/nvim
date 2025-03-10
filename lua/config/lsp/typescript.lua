local base = require("config.lsp.base")
local lspconfig = require("lspconfig")

-- configure ts_ls
lspconfig.ts_ls.setup({
	capabilities = base.capabilities,
	settings = base.settings,
	on_attach = function(client, bufnr)
		base.on_attach(client, bufnr)
		-- format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.code_action({
					context = { only = { "source.organizeImports" } },
					apply = true,
				})
				vim.wait(100)
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
})
