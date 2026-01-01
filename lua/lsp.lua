local M = {}

M.setup = function()
  local lsps = {
    'bashls',
    'basedpyright',
    'clangd',
    'gopls',
    'lua_ls',
    'ruff',
    'rust_analyzer',
    'ts_ls',
  }

  for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
  end
end

return M
