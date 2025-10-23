local M = {}

M.setup = function()
  vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
end

return M
