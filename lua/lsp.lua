local M = {}

M.setup = function()
  local lsps = {
    'lua_ls',
    'basedpyright',
    'ruff',
    'gopls',
  }

  for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
  end
end

return M
