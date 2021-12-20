
local M = {}

M.init =  function (theme)
  if not theme then
    theme = require("core.config").ui.theme
  end
  vim.g.nvea_theme = theme

  local color = require("colors.utils")
  color.highlight()
end

return M
