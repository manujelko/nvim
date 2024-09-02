require("telescope").load_extension("fzf")

-- search opened files
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>")
-- search recently opened files
vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>")
-- search files in the current working directory
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- search for a pattern in all files in the current working directory
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
-- search diagnostic messages: A diagnostic can be an error, a warnging or a hint
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
-- search for a pattern in the current file
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
