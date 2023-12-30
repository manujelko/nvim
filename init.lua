-- core
require('user.core.keymaps')
require('user.core.options')
require('user.core.diagnostics')
require('user.core.autocmds')
-- plugins
require('user.plugins.setup')  -- this one has to be called first
require('user.plugins.comments')
require('user.plugins.completion')
require('user.plugins.lualine')
require('user.plugins.nvim-tree')
require('user.plugins.telescope')
require('user.plugins.theme')
require('user.plugins.treesitter')
-- plugins/lsp
require('user.plugins.lsp.setup')  -- this one has to be called first
require('user.plugins.lsp.servers.awk_ls')
require('user.plugins.lsp.servers.bashls')
require('user.plugins.lsp.servers.clangd')
require('user.plugins.lsp.servers.gopls')
require('user.plugins.lsp.servers.lua_ls')
require('user.plugins.lsp.servers.pyright')
require('user.plugins.lsp.servers.ruff_lsp')
require('user.plugins.lsp.servers.tsserver')
-- utils
require('user.utils.pyvenv')
