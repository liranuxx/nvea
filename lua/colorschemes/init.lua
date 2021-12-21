local M = {}
local th_name = require("core.config").ui.theme

M.get = function (theme)
  if not theme then
    theme = th_name
  end
  return require("colorschemes."..theme)
end

return M
