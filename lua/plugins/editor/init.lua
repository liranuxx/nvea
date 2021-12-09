local status = require("core.config").plugins.status
local M = {}

M.editor = function(use)
  use {
      "max397574/better-escape.nvim",
      disable = not status.esc_insertmode,
      event = "InsertEnter",
      config = require("plugins.editor.config").better_escape,
   }
   use {
      "norcalli/nvim-colorizer.lua",
      disable = not status.colorizer,
      event = "BufRead",
      config = require("plugins.editor.config").colorizer,
   }
   use {
      'itchyny/vim-cursorword',
      disable = not status.cursorword,
      event = {'BufReadPre','BufNewFile'},
      config = require("plugins.editor.config").cursorword,
   }
   use {
      "windwp/nvim-autopairs",
      disable = not status.autopairs,
      after = "nvim-cmp",
      config = require("plugins.editor.config").autopairs,
   }
   use {
     "lukas-reineke/indent-blankline.nvim",
     disable = not status.blankline,
     event = "BufRead",
     config = require("plugins.editor.config").blankline,
   }
   use {
    'karb94/neoscroll.nvim',
    config = require("plugins.editor.config").neoscroll(),
  }

end

return M
