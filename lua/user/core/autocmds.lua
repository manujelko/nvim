-- reload config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- disable comment continuation
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end
})

-- turn on spell checking in markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
    end
})
