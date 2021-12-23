local status = require("core.config").plugins.status
local M = {}

M.lspconfig = function(use)
  use {
    "neovim/nvim-lspconfig",
    disable = not status.lsp,
    config = [[require("plugins.lsp.lspconfig")]],
    requires = {
      {
        "williamboman/nvim-lsp-installer",
        config = [[require("plugins.lsp.lsp_installer")]]
      },
      {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
      }
    },
  }
  use {
    "mhartington/formatter.nvim",
    config = [[require("plugins.lsp.formatter")]]
  }
end
return M
