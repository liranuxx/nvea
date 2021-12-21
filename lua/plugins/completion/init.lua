local status = require("core.config").plugins.status
local M = {}

M.cmp = function(use)
  use {
    "neovim/nvim-lspconfig",
    config = [[require("plugins.completion.lspconfig")]]
  }
  use {
    "williamboman/nvim-lsp-installer",
    alfter = "nvim-lspconfig",
    config = require("plugins.completion.config").lspinstaller()
  }
  use {
    "ray-x/lsp_signature.nvim",
    disable = not status.lspsignature,
    after = "nvim-lspconfig"
  }
  use {
    "hrsh7th/nvim-cmp",
    disable = not status.cmp,
    events = "InsertEnter",
    config = [[require("plugins.completion.cmp")]],
    wants = "LuaSnip",
    require ={}
  }
  use {
    "L3MON4D3/LuaSnip",
    config = require("plugins.completion.config").luasnip(),
  }
  use {
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path"
  }
  use {
    "mhartington/formatter.nvim",
    config = require("plugins.completion.config").formatter()
  }
end
return M
