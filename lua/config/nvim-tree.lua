-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

require("nvim-tree").setup({
    git = {
        ignore = false,
    },
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            },
        },
    },
    hijack_cursor = false,
    on_attach = function(bufnr)
        local bufmap = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
        end

        local api = require("nvim-tree.api")

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        bufmap("L", api.node.open.edit, "Expand folder or go to file")
        bufmap("H", api.node.navigate.parent_close, "Close parent folder")
        bufmap("gh", api.tree.toggle_hidden_filter, "Toggle hidden files")
    end,
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
