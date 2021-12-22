local present, cmp = pcall(require,"cmp")
if not present then
  return print("Cmp not present!!!")
end

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
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        buffer = "BUF",
        path = "[PATH]",
        luasnip = "[SNIP]",
        spell = "[SPE]"
      })[entry.source.name]

      return vim_item
    end
  },
  mapping = {
     ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end,{"i","s"}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end,{"i","s"})
  },
  sources = {
    {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "buffer"},
    {name = "luasnip"}, {name = "path"}, {name = "spell"},
  },
  completion = { completeopt = "menu,menuone,noinsert" },
  experimental = { ghost_text = true },
}
