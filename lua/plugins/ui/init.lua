local plugin_status = require("core.config").plugins.status

local M = {}
M.ui = function(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
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
  use {
    "gelguy/wilder.nvim",
    run = "UpdateRemotePlugins",
    config = function()
      local status, wilder = pcall(require, "plugins.ui.config")
      if not status then
        return print("Wilder not found!")
      end
      wilder.wilder()
    end
  }
end
return M
