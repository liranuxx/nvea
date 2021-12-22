local status = require("core.config").plugins.status
local M = {}

M.cmp = function(use)
  use {
    "neovim/nvim-lspconfig",
    config = [[require("plugins.completion.lspconfig")]]
  }
  use {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = require("plugins.completion.config").lspinstaller
  }
  use {
    "ray-x/lsp_signature.nvim",
    disable = not status.lspsignature,
    after = "nvim-lspconfig",
    config = require("plugins.completion.config").lsp_signature
  }
  use {
    "hrsh7th/nvim-cmp",
    disable = not status.cmp,
    events = "InsertEnter",
    config = [[require("plugins.completion.cmp")]],
    requires ={
      {"hrsh7th/cmp-nvim-lsp",opt=true},
      {"saadparwaiz1/cmp_luasnip",opt=true},
      {"hrsh7th/cmp-nvim-lua",opt=true},
      {"hrsh7th/cmp-cmdline",opt=true},
      {"hrsh7th/cmp-buffer",opt=true},
      {"hrsh7th/cmp-path",opt=true},
      {"hrsh7th/cmp-look",opt=true},
    }
  }
  use {
    "L3MON4D3/LuaSnip",
    config = require("plugins.completion.config").luasnip,
    requires = {"rafamadriz/friendly-snippets"},
  }
  use {
    "mhartington/formatter.nvim",
    config = require("plugins.completion.config").formatter
  }
  use {
    'weilbith/nvim-code-action-menu',
    after = "nvim-lspconfig",
    cmd = 'CodeActionMenu',
  }
end
return M
