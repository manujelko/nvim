-- reload config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- turn on spell checking in markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
    end
})
