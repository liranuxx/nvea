local M = {}
M.gui = function(group_settings)
  if group_settings.bold then return "bold"
  elseif group_settings.underline then return "underline"
  elseif group_settings.undercurl then return "undercurl"
  elseif group_settings.italic then return "italic"
  elseif group_settings.reverse then return "reverse"
  else return "NONE" end
end

M.vim_highlights = function(highlights)
  for group_name, group_settings in pairs(highlights) do
    local fg = group_settings.fg and "guifg=" .. group_settings.fg or "guifg=NONE"
    local bg = group_settings.bg and "guibg=" .. group_settings.bg or "guibg=NONE"
    local sp = group_settings.sp and "guisp=" .. group_settings.sp or "guisp=NONE"
    vim.cmd("highlight " .. group_name .. " ".."gui="..M.gui(group_settings).." "..fg .. " " .. bg .. " " .. sp)
  end
end

M.hi_link = function (highlights)
  for new_link, old_link in pairs(highlights) do
    vim.cmd("hi link "..new_link..' '..old_link)
  end
end

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
  vim.cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
  vim.cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
  vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M
