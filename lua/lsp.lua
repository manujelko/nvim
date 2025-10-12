local M = {}

M.setup = function()
  local lsps = {
    'lua_ls',
    'basedpyright',
    'ruff',
  }

  for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
  end
end

return M
