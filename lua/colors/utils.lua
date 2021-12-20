local M = {}

local function gui(group_settings)
  if group_settings.bold then return "bold"
  elseif group_settings.underline then return "underline"
  elseif group_settings.undercurl then return "undercurl"
  elseif group_settings.italic then return "italic"
  elseif group_settings.reverse then return "reverse"
  else return "NONE" end
end

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    local fg = group_settings.fg and "guifg=" .. group_settings.fg or "guifg=NONE"
    local bg = group_settings.bg and "guibg=" .. group_settings.bg or "guibg=NONE"
    local sp = group_settings.sp and "guisp=" .. group_settings.sp or "guisp=NONE"
    vim.cmd("highlight " .. group_name .. " ".."gui="..gui(group_settings).." "..fg .. " " .. bg .. " " .. sp)
  end
end
function M.highlight()
  local hl = require("colors.highlights")
  local plugins = require("colors.hl_plugins")
  local langs = require("colors.hl_langs")
  for _, group in pairs(hl) do vim_highlights(group) end
  for _, group in pairs(plugins) do vim_highlights(group) end
  for _, group in pairs(langs) do vim_highlights(group) end
end

function M.toggle_theme(theme)
  if not theme then
    theme = vim.g.nvea_theme
  end
end


return M
