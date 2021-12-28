local status = require("core.config").plugins.status

return function(use)
  use {
    'hrsh7th/nvim-cmp',
    disable = not status.cmp,
    requires = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = [[require("plugins.completion.cmp")]],
    -- event = 'InsertEnter *',
  }
end
