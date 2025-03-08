-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- default spacing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- disable indentation, leave it up to treesitter
vim.opt.autoindent = false
vim.opt.smartindent = false
vim.opt.cindent = false

-- remove ~ marking empty lines
vim.opt.fillchars:append({ eob = " " })

-- wrap text
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
