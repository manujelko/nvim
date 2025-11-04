local M = {}

M.setup = function()
  require('venv-selector').setup({
    picker = 'mini-pick',
  })
  vim.keymap.set('n', '<leader>fv', '<cmd>VenvSelect<cr>')
end

return M
