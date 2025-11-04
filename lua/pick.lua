local M = {}

M.setup = function()
  -- Picker
  local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
      anchor = 'NW', height = height, width = width,
      row = math.floor(0.5 * (vim.o.lines - height)),
      col = math.floor(0.5 * (vim.o.columns - width)),
    }
  end
  require('mini.pick').setup({
    window = {
      config = win_config,
    },
  })
  vim.keymap.set('n', '<leader><leader>', '<cmd>lua MiniPick.builtin.buffers()<cr>')
  vim.keymap.set('n', '<leader>ff', '<cmd>lua MiniPick.builtin.files()<cr>')
  vim.keymap.set('n', '<leader>fg', '<cmd>lua MiniPick.builtin.grep_live()<cr>')
end

return M
