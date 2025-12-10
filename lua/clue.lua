local M = {}

M.setup = function()
  local miniclue = require('mini.clue')
  miniclue.setup({
    triggers = {
      { mode = 'n', keys = '<Leader>' },
      { mode = 'n', keys = 'g' },
    },

    clues = {
      { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
      { mode = 'n', keys = '<Leader>f', desc = '+Find' },
      miniclue.gen_clues.g(),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.registers(),
    },

    window = {
      config = {
        width = 'auto',
        border = 'double',
      },
      delay = 100,
      scroll_down = '<C-d>',
      scroll_up = '<C-u>',
    },

  })
end

return M
