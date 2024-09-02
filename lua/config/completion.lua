vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  -- data sources to populate the completion list
  sources = {
    -- autocomplete file paths
    { name = "path" },
    -- suggestions based on the language server
    { name = "nvim_lsp", keyword_length = 1 },
    -- suggest words found in the current buffer
    { name = "buffer",   keyword_length = 3 },
    -- show available snippets
    { name = "luasnip",  keyword_length = 2 },
  },
  -- appearance and settings for the documentation window
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    -- order of the elements in an item
    fields = { "menu", "abbr", "kind" },
    -- customize the appearance of the completion menu
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "L",
        luasnip = "S",
        buffer = "B",
        path = "P",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  -- completion keybindings
  mapping = {
    -- confirm selection
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    -- cancel completion
    ["<C-e>"] = cmp.mapping.abort(),
    -- move between completion items
    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
    -- scroll text in the documentation window
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    -- jump to the next placeholder in the snippet
    ["<C-f>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- jump to the previous placeholder in the snippet
    ["<C-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- autocomplete with tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      local col = vim.fn.col(".") - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
})
