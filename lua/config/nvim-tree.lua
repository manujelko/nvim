-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
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
  end
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
