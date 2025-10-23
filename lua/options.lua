local M = {}

M.setup = function()
  vim.g.mapleader = ' '
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.signcolumn = 'yes'
  vim.o.wrap = false
  vim.o.hlsearch = false
  vim.o.incsearch = true
  vim.o.smartcase = true
  vim.o.ignorecase = true
  vim.o.mouse = 'nvi'
  vim.o.swapfile = false
  vim.o.completeopt = 'menu,menuone,noselect'
  vim.o.termguicolors = true
end

return M
