local M = {}

M.setup = function()
  require('mini.files').setup()

  -- Toggle file explorer
  vim.keymap.set('n', '<leader>e', function()
    if vim.bo.filetype ~= 'minifiles' then
      return '<cmd>lua MiniFiles.open()<cr>'
    end

    return '<cmd>lua MiniFiles.close()<cr>'
  end, { expr = true })
end

return M
