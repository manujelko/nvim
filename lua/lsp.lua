local M = {}

M.setup = function()
  local lsps = {
    'basedpyright',
    'clangd',
    'gopls',
    'lua_ls',
    'ruff',
    'rust_analyzer',
  }

  for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
  end
end

return M
