local status, cmp = pcall(require, "cmp")
if not status then
  return print("Cmp not found!!!")
end

local status, luasnip = pcall(require,"luasnip")
if not status then
  return print("Luasnip not found!!!")
end

require("luasnip/loaders/from_vscode").lazy_load()

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

vim.cmd [[packadd nvim-autopairs]]
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = {"kind","abbr","menu"},
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", lspkind_icons[vim_item.kind])
      --vim_item.menu = nil
      vim_item.menu = ({
         buffer = "﬘",
         nvim_lsp = "",
         luasnip = "🎈",
         treesitter = '',
         nvim_lua = "",
         spell = '暈'
      -- nvim_lsp = "[LSP]",
      -- nvim_lua = "[LUA]",
      -- buffer = "BUF",
      -- path = "[PATH]",
      -- luasnip = "[SNIP]",
      -- spell = "[SPE]"
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,{"i","s"}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,{"i","s"})
  },
  sources = {
    {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "buffer"},
    {name = "luasnip"}, {name = "path"},
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = {
    border = "single"
  },
  experimental = {native_menu=false, ghost_text = true },
}
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--       { name = 'cmdline' }
--     })
-- })
