local plugin_status = require("core.config").plugins.status

local M = {}
M.ui = function(use)
  use {
    "wbthomason/packer.nvim",
    opt = true,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = [[require("plugins.ui.treesitter")]],
    requires = {
      {'nvim-treesitter/nvim-treesitter-refactor',opt=true},
      {'nvim-treesitter/nvim-treesitter-textobjects',opt=true},
      {'p00f/nvim-ts-rainbow',opt=true},
      {
        'romgrk/nvim-treesitter-context',
        after = "nvim-treesitter",
        config = require("plugins.ui.config").context
      },
    }
  }
  use { 'rktjmp/lush.nvim' }
end
return M
