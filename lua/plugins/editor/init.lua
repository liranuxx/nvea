local status = require("core.config").plugins.status
local conf = require("plugins.editor.config")
local M = {}

M.editor = function(use)
  use {
      "max397574/better-escape.nvim",
      disable = not status.esc_insertmode,
      event = "InsertEnter",
      config = conf.better_escape,
   }
   use {
      "norcalli/nvim-colorizer.lua",
      disable = not status.colorizer,
      -- event = "BufRead",
      config = conf.colorizer,
   }
   use {
      'itchyny/vim-cursorword',
      disable = not status.cursorword,
      event = {'BufReadPre','BufNewFile'},
      config = conf.cursorword,
   }
   use {
      "windwp/nvim-autopairs",
      disable = not status.autopairs,
      after = "nvim-cmp",
      config = conf.autopairs,
   }
   use {
     "lukas-reineke/indent-blankline.nvim",
     disable = not status.blankline,
     event = "BufRead",
     config = conf.blankline,
   }
   use {
    'karb94/neoscroll.nvim',
    config = conf.neoscroll,
  }

end

return M
