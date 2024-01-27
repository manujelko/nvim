local common = require('user.plugins.lsp.common')
local lspconfig = require('lspconfig')
local lspconfig_configs = require('lspconfig.configs')

if not lspconfig_configs then
    lspconfig_configs.ruff_lsp = {
        default_config = {
            cmd = {'ruff-lsp'},
            filetypes = {'python'},
            root_dir = require('lspconfig').util.find_git_ancestor,
            init_options = {
                settings = {
                    args = {}
                }
            }
        }
    }
end
lspconfig.ruff_lsp.setup({
    on_attach = function(client, bufnr)
        common.on_attach(client, bufnr)
        -- add formatting on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.code_action({
                    context = { only = { "source.organizeImports" } },
                    apply = true,
                })
                vim.wait(100)
                vim.lsp.buf.format({ async = true })
            end,
        })
    end,
    capabilities = common.capabilities,
})
