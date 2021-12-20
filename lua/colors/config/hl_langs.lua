local colors = require("colors.themes."..vim.g.nvea_theme)

local red = colors.red
local dark_red = colors.dark_red
local green = colors.green
local yellow = colors.yellow
local dark_yellow = colors.dark_yellow
local blue = colors.blue
local purple = colors.purple
local cyan = colors.cyan
local white = colors.white
local black = colors.black
local foreground = colors.foreground
local background = colors.background
local comment_grey = colors.comment_grey
local gutter_fg_grey = colors.gutter_fg_grey
local cursor_grey = colors.cursor_grey
local visual_grey = colors.visual_grey
local menu_grey = colors.menu_grey
local special_grey = colors.special_grey
local vertsplit = colors.vertsplit

local langs = {}

langs.c = {
  cInclude = { fg = blue },
  cStorageClass = { fg = purple },
  cTypedef = { fg = purple },
  cDefine = { fg = cyan },
  cTSInclude = { fg = blue },
  cTSConstant = { fg = cyan },
  cTSConstMacro = { fg = purple },
}

langs.cpp = {
  cppStatement = { fg = purple, bold = true },
  cppTSInclude = { fg = blue },
  cppTSConstant = { fg = cyan },
  cppTSConstMacro = { fg = purple },
}

-- langs.python = {}

-- langs.bash = {}

-- langs.lua = {}

-- langs.java = {}

langs.vim = {
  vimTSFuncMacro = {fg = cyan, bold = true},
  vimCommentTitle = {fg = comment_grey, bold = true},
  vimCommand ={fg = cyan, bold = true},
  vimLet = { fg = purple },
  vimFunction = { fg = blue },
  vimIsCommand = { fg = foreground },
  vimUserFunc = { fg = blue },
  vimFuncName = { fg = blue },
  vimMap = { fg = purple },
  vimMapModKey = { fg = dark_yellow },
  vimNotation = { fg = red },
  vimMapLhs = { fg = blue },
  vimMapRhs = { fg = blue },
  vimOption = { fg = red },
  vimUserAttrbKey = { fg = red },
  vimUserAttrb = { fg = blue },
  vimSynType = { fg = cyan },
  vimHiBang = { fg = purple },
  vimSet = { fg = yellow },
  vimSetEqual = { fg = yellow },
  vimSetSep = { fg = comment_grey },
  vimVar = { fg = foreground },
  vimFuncVar = { fg = foreground },
  vimContinue = { fg = comment_grey },
  vimAutoCmdSfxList = { fg = cyan },
}

langs.json = {
  jsonCommentError = { fg = white },
  jsonKeyword = { fg = red },
  jsonBoolean = { fg = dark_yellow },
  jsonNumber = { fg = dark_yellow },
  jsonQuote = { fg = white },
  jsonMissingCommaError = { fg = red, reverse = true },
  jsonNoQuotesError = { fg = red, reverse = true },
  jsonNumError = { fg = red, reverse = true},
  jsonString = { fg = green },
  jsonStringSQError = { fg = red, reverse = true },
  jsonSemicolonError = { fg = red, reverse = true},
}

langs.markdown = {
  markdownBlockquote = { fg = comment_grey },
  markdownBold = { fg = dark_yellow, bold = true },
  markdownCode = { fg = green },
  markdownCodeBlock = { fg = green },
  markdownCodeDelimiter = { fg = green },
  markdownH1 = { fg = red },
  markdownH2 = { fg = red },
  markdownH3 = { fg = red },
  markdownH4 = { fg = red },
  markdownH5 = { fg = red },
  markdownH6 = { fg = red },
  markdownHeadingDelimiter = { fg = red },
  markdownHeadingRule = { fg = comment_grey },
  markdownId = { fg = purple },
  markdownIdDeclaration = { fg = blue },
  markdownIdDelimiter = { fg = purple },
  markdownItalic = { fg = purple, italic = true },
  markdownLinkDelimiter = { fg = purple },
  markdownLinkText = { fg = blue },
  markdownListMarker = { fg = red },
  markdownOrderedListMarker = { fg = red },
  markdownRule = { fg = comment_grey },
  markdownUrl = { fg = cyan, underline = true },
}

return langs
