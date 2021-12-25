local plugin_status = require("core.config").plugins.status
local M = {}

M.tools = function(use)
  use {"kyazdani42/nvim-web-devicons"}
  use {
    "numToStr/Comment.nvim",
    disable = not plugin_status.comment,
    config = [[require("Comment").setup()]]
  }
  use {
    "nvim-lualine/lualine.nvim",
    disable = not plugin_status.lualine,
    config = [[require("plugins.tools.lualine")]]
  }

  use {
    "akinsho/bufferline.nvim",
    disable = not plugin_status.bufferline,
    after = "nvim-web-devicons",
    config = [[require("plugins.tools.bufferline")]]
  }
  use {
    "kyazdani42/nvim-tree.lua",
    disable = not plugin_status.nvimtree,
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},
    config = [[require("plugins.tools.nvimtree")]]
  }
  use {
    "nvim-telescope/telescope.nvim",
    disable = not plugin_status.telescope,
    requires = {"nvim-lua/plenary.nvim"},
    config = [[require("plugins.tools.telescope")]]
  }
  use {
    "yuki-uthman/vim-fzf-dictionary",
    requires = {"junegunn/fzf.vim"}
  }
  use {
    "folke/which-key.nvim",
    disable = not plugin_status.whichkey,
    config = [[require("plugins.tools.whichkey")]]
  }
  use {
    "lewis6991/gitsigns.nvim",
    disable = not plugin_status.gitsigns,
    requires = {"nvim-lua/plenary.nvim"},
    config = [[require('plugins.tools.gitsigns')]]
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    disable = not plugin_status.markdown_preview,
    ft = "markdown",
    config = require("plugins.tools.config").markdown_preview
  }
  use {
    "glepnir/dashboard-nvim",
    status = plugin_status.dashboard,
    config = [[require('plugins.tools.dashboard')]]
  }
  use {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
    end
  }
  use {
    "ahmedkhalf/project.nvim",
    config = require("plugins.tools.config").project
  }
  use {
    "akinsho/toggleterm.nvim",
    config = [[require("plugins.tools.toggleterm")]]
  }
end

return M
