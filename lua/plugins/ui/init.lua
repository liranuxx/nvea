local plugin_status = require("core.config").plugins.status

local M = {}
M.ui = function(use)
  use {
    "wbthomason/packer.nvim",
    opt = true,
  }

  use { "nvim-lua/plenary.nvim", }

  use { "liranuxx/nvim-base16.lua", }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = require("plugins.ui.config").treesitter(),
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    }
  }

  use {
    'p00f/nvim-ts-rainbow',
    disble = not plugin_status.rauinbow,
    config = require("plugins.ui.config").rainbow(),
  }
end

return M
