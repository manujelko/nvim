-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable comment continuation
vim.opt.formatoptions:remove({'r', 'o'})

-- show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- enable mouse
vim.opt.mouse = 'a'

-- case sensitive search only with uppercase letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable search highlighting
vim.opt.hlsearch = false

-- wrap lines
vim.opt.wrap = true

-- add visual column
vim.opt.colorcolumn = "88"

-- preserve indentation of a virtual line
vim.opt.breakindent = true

-- amount of spaces a tab character occupies
vim.opt.tabstop = 4

-- amount of characters neovim will use to indent a line
vim.opt.shiftwidth = 4

-- should neovim transform tabs into spaces
vim.opt.expandtab = true
