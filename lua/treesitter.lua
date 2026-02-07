local M = {}

M.setup = function()
  -- Configure treesitter
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'caddy',
      'cpp',
      'css',
      'go',
      'gomod',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'vimdoc',
      'python',
      'rust',
      'sql',
      'toml',
      'typescript',
      'yaml',
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = false,
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
          ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
        },
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'V',
          ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = false,
      },
    },
  })
end

return M
