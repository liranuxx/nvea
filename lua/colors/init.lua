vim.g.nvea_theme = require("core.config").ui.theme
local load_theme = require("colors.config")

local function init(theme)
  if not theme then
    theme = vim.g.nvea_theme
  end
  -- vim.cmd([[colorscheme onedark]])
  load_theme.setup()
end

init()
