local M = {}

M.setup = function()
  require('mini.sessions').setup()
  vim.keymap.set('n', '<leader>fs', '<cmd>lua MiniSessions.select()<cr>')
end

return M
