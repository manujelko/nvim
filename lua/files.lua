local M = {}

M.setup = function()
  local mf = require('mini.files')
  mf.setup()

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id

      -- Set mappings for every mini.files buffer (each column is its own buffer)
      local function go_out_locked(opts)
        local st = mf.get_explorer_state()
        if not st then return end
        -- Don't allow going above the leftmost column (anchor)
        if st.depth_focus <= 1 then return end
        mf.go_out(opts)
      end

      vim.keymap.set('n', 'h', function() go_out_locked() end, { buffer = buf_id, silent = true })
      vim.keymap.set('n', 'H', function() go_out_locked({}) end, { buffer = buf_id, silent = true })
      vim.keymap.set('n', '@', '<Nop>', { buffer = buf_id, silent = true }) -- optional

      -- IMPORTANT: trim_left only once (when explorer just opened, depth == 1)
      if vim.g.__mini_files_root_trimmed then
        return
      end

      vim.g.__mini_files_root_trimmed = true
      vim.schedule(function()
        local st = mf.get_explorer_state()
        if st and st.depth == 1 then
          pcall(mf.trim_left)
        end
      end)
    end,
  })

  -- Reset the "trimmed" flag when explorer closes (so next open anchors again)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesExplorerClose',
    callback = function()
      vim.g.__mini_files_root_trimmed = false
    end,
  })

  -- Toggle file explorer
  vim.keymap.set('n', '<Leader>e', function()
    if vim.bo.filetype ~= 'minifiles' then
      return '<cmd>lua MiniFiles.open()<cr>'
    end
    return '<cmd>lua MiniFiles.close()<cr>'
  end, { expr = true, desc = 'Explorer' })
end

return M
