local plugin_status = require("core.config").plugins.status

local M = {}
M.ui = function(use)
  use {
    "wbthomason/packer.nvim",
    opt = true,
  }
  use { "nvim-lua/plenary.nvim", }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = require("plugins.ui.config").treesitter(),
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects'
    }
  }

  use {
    'p00f/nvim-ts-rainbow',
    disble = not plugin_status.rainbow,
    config = require("plugins.ui.config").rainbow(),
  }
  use { 'rktjmp/lush.nvim' }
end

return M
