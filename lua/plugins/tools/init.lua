local status = require("core.config").plugins.status
local conf = require("plugins.tools.config")

return function(use)
  use {"kyazdani42/nvim-web-devicons"}
  use {
    "nvim-lualine/lualine.nvim",
    disable = not status.lualine,
    after = "nvim-web-devicons",
    config = [[require("plugins.tools.init-lualine")]]
  }
  use {
    "akinsho/bufferline.nvim",
    disable = not status.bufferline,
    after = "nvim-web-devicons",
    config = [[require("plugins.tools.init-bufferline")]]
  }
  use {
    "kyazdani42/nvim-tree.lua",
    disable = not status.nvimtree,
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},
    config = [[require("plugins.tools.nvimtree")]]
  }
  use {
    "numToStr/Comment.nvim",
    disable = not status.comment,
    config = conf.comment
  }

  use {
    "nvim-telescope/telescope.nvim",
    disable = not status.telescope,
    config = [[require("plugins.tools.init-telescope")]]
  }
  use {
    "yuki-uthman/vim-fzf-dictionary",
    requires = {"junegunn/fzf.vim"}
  }
  use {
    "folke/which-key.nvim",
    disable = not status.whichkey,
    config = [[require("plugins.tools.whichkey")]]
  }
  use {
    "lewis6991/gitsigns.nvim",
    disable = not status.gitsigns,
    config = [[require('plugins.tools.init-gitsigns')]]
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    disable = not status.markdown_preview,
    ft = "markdown",
    cmd = {"MarkdownPreview"},
    config = conf.markdown_preview
  }
  use {
    "phaazon/hop.nvim",
    branch = "v1",
    config = conf.hop
  }
  use {
    "ahmedkhalf/project.nvim",
    config = conf.project
  }
  use {
    "akinsho/toggleterm.nvim",
    config = [[require("plugins.tools.init-toggleterm")]]
  }
end
