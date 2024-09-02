local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ""
    })
end

sign({ name = "DiagnosticSignError", text = "E" })
sign({ name = "DiagnosticSignWarn", text = "W" })
sign({ name = "DiagnosticSignHint", text = "H" })
sign({ name = "DiagnosticSignInfo", text = "I" })

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "awlays",
    },
})

-- help windows with borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
