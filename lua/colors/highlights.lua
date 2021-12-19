local cmd = vim.cmd
-- local colors = require("colors").get()
local onedark = require("colors.onedark").dark

local red = onedark.red
local dark_red = onedark.dark_red
local cyan = onedark.cyan
local black = onedark.black
local blue = onedark.blue
local green = onedark.green
local comment_grey = onedark.comment_grey
local one_bg = onedark.background
local purple = onedark.purple
local white = onedark.white
local yellow = onedark.yellow

local ui = require("core.config").ui

local fg = require("core.utils").fg
local fg_bg = require("core.utils").fg_bg
local bg = require("core.utils").bg

-- Comments
if ui.italic_comments then
  fg("Comment", comment_grey .. " gui=italic")
else
  fg("Comment", comment_grey)
end

-- Disable cusror line
cmd "hi clear CursorLine"
-- Line number
fg("cursorlinenr", red)

-- same it bg, so it doesn't appear
-- buffer 结尾的波浪号
fg("EndOfBuffer", one_bg)

-- For floating windows
bg("NormalFloat", one_bg)


-- Pmenu 补全
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg)
bg("PmenuSel", cyan)
bg("PmenuThumb", "NONE")

-- inactive statuslines as thin lines
-- fg("StatusLineNC", red .. " gui=underline")

-- linenumber colors
-- fg("LineNr", white)
-- fg("NvimInternalError", red)
fg("VertSplit", one_bg)



-- Indent blankline plugin
fg("IndentBlanklineChar", purple)


-- NvimTree
fg("NvimTreeEndOfBuffer", one_bg)
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeOpenedFolderName", red)
bg("NvimTreeNormal", one_bg)
-- enable underline for root folder in nvim tree
fg("NvimTreeRootFolder", red .. " gui=underline")

-- Telescope
fg("TelescopeBorder", cyan)
fg_bg("TelescopePreviewTitle", green, one_bg)
fg_bg("TelescopePromptTitle", dark_red, one_bg)
fg_bg("TelescopeResultsTitle", cyan, one_bg)

-- Disable some highlight in nvim tree if transparency enabled
if ui.transparency then
  -- 透明
  bg("Normal", "NONE")
  bg("Folded", "NONE")
  fg("Comment", comment_grey)
  bg("NvimTreeNormal", "NONE")
  -- bg("NvimTreeStatusLineNC", "NONE")
  -- bg("NvimTreeVertSplit", "NONE")
end
