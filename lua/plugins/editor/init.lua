local status = require("core.config").plugins.status
local conf = require("plugins.editor.config")

return function(use)
   use {
      "norcalli/nvim-colorizer.lua",
      disable = not status.colorizer,
      event = "BufRead",
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
      events = "InsertEnter",
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
  use {
    "mg979/vim-visual-multi",
    branch = "master"
  }
  use {'brooth/far.vim'}
  use {'tpope/vim-surround'}

end
