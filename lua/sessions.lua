local M = {}

M.setup = function()
  require('mini.sessions').setup()
  vim.keymap.set('n', '<Leader>fs', '<cmd>lua MiniSessions.select()<cr>', { desc = 'Session' })
end

return M
