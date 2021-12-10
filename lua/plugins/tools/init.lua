local status = require("core.config").plugins.status
local M = {}

M.tools = function(use)
  use {
    "numToStr/Comment.nvim",
    disable = not status.comment,
    config = [[require("Comment").setup()]]
  }
  use {
    "kyazdani42/nvim-web-devicons"
  }
  use {
    "famiu/feline.nvim",
    disable = not status.feline,
    config = [[require("plugins.tools.statusline")]]
  }
  use {
    "akinsho/bufferline.nvim",
    disable = not status.bufferline,
    after = "nvim-web-devicons",
    config = [[require("plugins.tools.bufferline")]],
    setup = function()
      require("core.mappings").bufferline()
    end
  }
  use {
    "kyazdani42/nvim-tree.lua",
    disable = not status.nvimtree,
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = [[require("plugins.tools.nvimtree")]],
    setup = function()
      require("core.mappings").nvimtree()
    end
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-telescope/telescope-project.nvim"},
      {"nvim-lua/popup.nvim",opt = true},
      {"nvim-lua/plenary.nvim",opt = true}
    },
    config = [[require("plugins.tools.telescope")]],
    setup = function()
      require("core.mappings").telescope()
    end
  }

  use {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    config = require("plugins.tools.config").glow()
  }

  use {
    "folke/which-key.nvim",
    config = require("plugins.tools.config").whichkey()
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    config = [[require('plugins.tools.gitsigns')]]
  }
end

return M
