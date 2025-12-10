local M = {}

M.setup = function()
  require('venv-selector').setup({
    picker = 'mini-pick',
  })
  vim.keymap.set('n', '<Leader>fv', '<cmd>VenvSelect<cr>', { desc = 'Venv' })
end

return M
