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

-- preserve indentation of a virtual line
vim.opt.breakindent = true

-- amount of spaces a tab character occupies
vim.opt.tabstop = 4

-- amount of characters neovim will use to indent a line
vim.opt.shiftwidth = 4

-- should neovim transform tabs into spaces
vim.opt.expandtab = false

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

-- plugin manager
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim...')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- You can "comment out" the line below after lazy.nvim is installed
	--lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	-- list of plugins
	{'bluz71/vim-moonfly-colors'},
	{'nvim-lualine/lualine.nvim'},
})

-- color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('moonfly')

-- configure lualine
require('lualine').setup({
	options = {
		icons_enabled = false,
		theme = 'moonfly',
	}
})

-- configure netrw
vim.keymap.set('n', '<leader>pv', '<cmd>Lexplore<cr>')
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

-- reload config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

