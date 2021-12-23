local present, cmp = pcall(require,"cmp")
if not present then
  return print("Cmp not present!!!")
end

vim.cmd [[packadd cmp-nvim-lsp]]
vim.cmd [[packadd cmp_luasnip]]
vim.cmd [[packadd cmp-nvim-lua]]
vim.cmd [[packadd cmp-cmdline]]
vim.cmd [[packadd cmp-buffer]]
vim.cmd [[packadd cmp-path]]
vim.cmd [[packadd cmp-look]]

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
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
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
    format = function(_, vim_item)
      vim_item.kind = string.format("%s", lspkind_icons[vim_item.kind])
      vim_item.menu = nil
      -- vim_item.menu = ({
      --   buffer = "﬘",
      --   nvim_lsp = "",
      --   luasnip = "🐍",
      --   treesitter = '',
      --   nvim_lua = "",
      --   spell = '暈'
      -- nvim_lsp = "[LSP]",
      -- nvim_lua = "[LUA]",
      -- buffer = "BUF",
      -- path = "[PATH]",
      -- luasnip = "[SNIP]",
      -- spell = "[SPE]"
      --})[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    -- ["<C-p>"] = cmp.mapping.select_prev_item(),
    -- ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end,{"i","s"}),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require("luasnip").jump(-1)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,{"i","s"})
  },
  sources = {
    {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "buffer"},
    {name = "luasnip"}, {name = "path"}, {name = "look"}, {name = "spell"},
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  experimental = {native_menu=false, ghost_text = true },
}
