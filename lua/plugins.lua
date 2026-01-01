local function bootstrap()
  -- Put this at the top of 'init.lua'
  local path_package = vim.fn.stdpath('data') .. '/site'
  local mini_path = path_package .. '/pack/deps/start/mini.nvim'
  if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
      'git', 'clone', '--filter=blob:none',
      -- Uncomment next line to use 'stable' branch
      -- '--branch', 'stable',
      'https://github.com/nvim-mini/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
  end
end

local function install()
  require('mini.deps').setup()

  local add = MiniDeps.add

  -- Lsp config
  add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'williamboman/mason.nvim' },
  })

  -- Catppuccin
  add({ source = "catppuccin/nvim", name = "catppuccin" })

  -- Kanagawa
  add({ source = "rebelot/kanagawa.nvim", name = "kanagawa" })

  -- Treesitter
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })

  -- Treesitter text objects
  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    checkout = 'master',
    depends = { 'nvim-treesitter/nvim-treesitter' },
  })

  -- venv-selector
  add({
    source = 'linux-cultist/venv-selector.nvim',
    checkout = 'main',
  })

  -- nicer Python indentation
  add({
    source = 'Vimjas/vim-python-pep8-indent',
    checkout = 'master',
  })

  -- render markdown
  add({
    source = 'MeanderingProgrammer/render-markdown.nvim',
    checkout = 'main',
  })
end

local M = {}

M.setup = function()
  bootstrap()
  install()
end

return M
