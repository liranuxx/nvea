-- local packer = require("plugins.init_packer")
-- local use = packer.use

local M = {}
M.ui = function(use)
  use {
    "wbthomason/packer.nvim",
    opt = true,
  }
  use {"nvim-lua/plenary.nvim",}

  use {
    "liranuxx/nvim-base16.lua",
  }

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
    config = require("plugins.ui.config").rainbow(),
  }
end

return M
