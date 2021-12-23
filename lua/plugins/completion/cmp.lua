local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return print("Cmp not present!!!")
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return print("Luasnip not present!!!")
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

vim.cmd [[packadd cmp-nvim-lsp]]
vim.cmd [[packadd cmp_luasnip]]
vim.cmd [[packadd cmp-nvim-lua]]
vim.cmd [[packadd cmp-cmdline]]
vim.cmd [[packadd cmp-buffer]]
vim.cmd [[packadd cmp-path]]

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

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = {"kind","abbr", "menu"},
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
      elseif check_backspace() then
        fallback()
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
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {native_menu=false, ghost_text = true },
}
