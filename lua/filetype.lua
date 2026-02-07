local M = {}

M.setup = function()
  vim.filetype.add({
    extension = { caddy = 'caddy' },
    filename = { Caddyfile = 'caddy' },
  })
end

return M
