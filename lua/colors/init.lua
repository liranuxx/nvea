local M = {}

M.theme = "onedark"

M.init = function()
  local base16 = require("base16")

  base16(base16.themes(M.theme), true)
  require("colors.highlights")
end

M.get = function()
  return require("hl_themes."..M.theme)
end

return M
