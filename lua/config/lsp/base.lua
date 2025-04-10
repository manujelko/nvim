require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"gopls",
		"html",
		"lua_ls",
		"pyright",
		"ruff",
		"ts_ls",
	}
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, bufnr)
	local bufmap = function(mode, lhs, rhs)
		local opts = { buffer = true }
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- displays hover information about the symbol under the cursor
	bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
	-- jump to definition
	bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	-- jump to declaration
	bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
	-- list all the implementations for the symbol under the cursor
	bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
	-- jumps to the definition of the type symbol
	bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
	-- lists all the references
	bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
	-- displays a function"s signature information
	bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	-- renames all references to the symbol under the cursor
	bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
	-- selects a code action available at the current cursor position
	bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	-- show diagnosticts in a floating window
	bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
	-- move to the previous diagnostic
	bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	-- move to the next diagnostic
	bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	-- trigger completion with Ctrl+Space
	bufmap("i", "<C-Space>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	-- rename definition
	bufmap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
end

-- set a variable for common settings, if any, to use in individual LSP configs
local settings = {
	diagnostics = {
		underline = true,
		virtual_text = {
			spacing = 4,
			severity_limit = "Hint",
		},
		signs = true,
		update_in_insert = false,
		severity_sort = true,
	},
}

-- function use to merge settings
local function merge_settings(base, other)
	local result = {}

	for k, v in pairs(base) do
		if type(v) == "table" then
			result[k] = merge_settings(v, {})
		else
			result[k] = v
		end
	end

	for k, v in pairs(other) do
		local vv = base[k]
		if type(vv) == "table" and type(v) == "table" then
			result[k] = merge_settings(vv, v)
		elseif vv == nil then
			result[k] = v
		end
	end

	return result
end

return {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = settings,
	merge_settings = merge_settings,
}
