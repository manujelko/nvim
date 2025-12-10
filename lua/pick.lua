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
  vim.keymap.set('n', '<Leader><space>', '<cmd>lua MiniPick.builtin.buffers()<cr>', { desc = 'Buffer' })
  vim.keymap.set('n', '<Leader>ff', '<cmd>lua MiniPick.builtin.files()<cr>', { desc = 'File' })
  vim.keymap.set('n', '<Leader>fg', '<cmd>lua MiniPick.builtin.grep_live()<cr>', { desc = 'Grep' })
end

return M
