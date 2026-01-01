local M = {}

M.setup = function()
  vim.keymap.set('n', '<Leader>bd', '<cmd>bd<cr>', { desc = 'Delete' })
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- go to normal mode using Esc in terminal
end

return M
