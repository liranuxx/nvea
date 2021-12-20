local theme = require("colors.onedark")
vim.g.nvea_theme = require("core.config").ui.theme

local function init(theme)
  if not theme then
    theme = vim.g.nvea_theme
  end
  vim.cmd([[colorscheme onedark]])
  require("colors.highlights")
end

theme.setup()
