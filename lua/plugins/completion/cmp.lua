local present, cmp = pcall(require,"cmp")
if not present then
  return print("Cmp not present!!!")
end
vim.cmd [[highlight CmpItemAbbrDeprecated guifg=#D8DEE9 guibg=NONE gui=strikethrough]]
vim.cmd [[highlight CmpItemKindSnippet guifg=#BF616A guibg=NONE]]
vim.cmd [[highlight CmpItemKindUnit guifg=#D08770 guibg=NONE]]
vim.cmd [[highlight CmpItemKindProperty guifg=#A3BE8C guibg=NONE]]
vim.cmd [[highlight CmpItemKindKeyword guifg=#EBCB8B guibg=NONE]]
vim.cmd [[highlight CmpItemAbbrMatch guifg=#5E81AC guibg=NONE]]
vim.cmd [[highlight CmpItemAbbrMatchFuzzy guifg=#5E81AC guibg=NONE]]
vim.cmd [[highlight CmpItemKindVariable guifg=#8FBCBB guibg=NONE]]
vim.cmd [[highlight CmpItemKindInterface guifg=#88C0D0 guibg=NONE]]
vim.cmd [[highlight CmpItemKindText guifg=#81A1C1 guibg=NONE]]
vim.cmd [[highlight CmpItemKindFunction guifg=#B48EAD guibg=NONE]]
vim.cmd [[highlight CmpItemKindMethod guifg=#B48EAD guibg=NONE]]

local lspkind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[PATH]",
        luasnip = "[SNIP]",
        spell = "[SPELL]"
      })[entry.source.name]

      return vim_item
    end
  },
  mapping = {
     ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace,select = true}),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "luasnip"},
    {name = "path"}, {name = "spell"}, {name = "calc"},
  }
}
