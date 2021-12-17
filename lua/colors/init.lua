vim.g.nvea_theme = require("core.config").ui.theme
local M = {}

M.init = function(theme)
  if not theme then
    theme = vim.g.nvea_theme
  end
  local present, base16 = pcall(require,"base16")
  if not present then
    return print("Theme not present!")
  end

  base16(base16.themes(theme), true)
  require("colors.highlights")
end

M.get = function(theme)
  if not theme then
    theme = vim.g.nvea_theme
  end
  return require("hl_themes."..theme)
end

return M
