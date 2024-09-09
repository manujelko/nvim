vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
    signs = {
        Error = { text = "E", texthl = "DiagnosticSignError" },
        Warn = { text = "W", texthl = "DiagnosticSignWarn" },
        Hint = { text = "H", texthl = "DiagnosticSignHint" },
        Info = { text = "I", texthl = "DiagnosticSignInfo" },
    },
})

-- help windows with borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
