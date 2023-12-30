-- map leader to space
vim.g.mapleader = ' '

-- save file
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- copy to clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y')

-- paste from clipboard
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

-- delete without changing the register
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- select all the text in the current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
