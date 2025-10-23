local M = {}

M.setup = function()
  require('mini.icons').setup({
    extension = {
      go = { glyph = '', hl='MiniIconsBlue' },
    },
    file = {
      ['go.mod']  = { glyph = '', hl='MiniIconsRed' },
      ['go.work']  = { glyph = '', hl='MiniIconsPurple' },
    },
  })
end

return M
