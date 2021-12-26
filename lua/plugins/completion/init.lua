local status = require("core.config").plugins.status
local M = {}
M.cmpletion = function(use)
  use {
    "hrsh7th/nvim-cmp",
    disable = not status.cmp,
    event = "BufRead",
    config = [[require("plugins.completion.cmp")]],
    requires = {
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      {"hrsh7th/cmp-nvim-lsp", opt = true},
      {"saadparwaiz1/cmp_luasnip", opt = true},
      {"hrsh7th/cmp-nvim-lua", opt = true},
      {"hrsh7th/cmp-cmdline", opt = true},
      {"hrsh7th/cmp-buffer", opt = true},
      {"hrsh7th/cmp-path", opt = true}
    }
  }
end
return M
