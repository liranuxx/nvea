local c = require("colors").get()

local langs = {}

langs.c = {
  cInclude = { fg = c.blue },
  cStorageClass = { fg = c.purple },
  cTypedef = { fg = c.purple },
  cDefine = { fg = c.cyan },
  cTSInclude = { fg = c.blue },
  cTSConstant = { fg = c.cyan },
  cTSConstMacro = { fg = c.purple },
}

langs.cpp = {
  cppStatement = { fg = c.purple, bold = true },
  cppTSInclude = { fg = c.blue },
  cppTSConstant = { fg = c.cyan },
  cppTSConstMacro = { fg = c.purple },
}

-- langs.python = {}

-- langs.bash = {}

-- langs.lua = {}

-- langs.java = {}

langs.vim = {
  vimTSFuncMacro = {fg = c.cyan, bold = true},
  vimCommentTitle = {fg = c.comment_grey, bold = true},
  vimCommand ={fg = c.cyan, bold = true},
  vimLet = { fg = c.purple },
  vimFunction = { fg = c.blue },
  vimIsCommand = { fg = c.foreground },
  vimUserFunc = { fg = c.blue },
  vimFuncName = { fg = c.blue },
  vimMap = { fg = c.purple },
  vimMapModKey = { fg = c.dark_yellow },
  vimNotation = { fg = c.red },
  vimMapLhs = { fg = c.blue },
  vimMapRhs = { fg = c.blue },
  vimOption = { fg = c.red },
  vimUserAttrbKey = { fg = c.red },
  vimUserAttrb = { fg = c.blue },
  vimSynType = { fg = c.cyan },
  vimHiBang = { fg = c.purple },
  vimSet = { fg = c.yellow },
  vimSetEqual = { fg = c.yellow },
  vimSetSep = { fg = c.comment_grey },
  vimVar = { fg = c.foreground },
  vimFuncVar = { fg = c.foreground },
  vimContinue = { fg = c.comment_grey },
  vimAutoCmdSfxList = { fg = c.cyan },
}

langs.json = {
  jsonCommentError = { fg = c.white },
  jsonKeyword = { fg = c.red },
  jsonBoolean = { fg = c.dark_yellow },
  jsonNumber = { fg = c.dark_yellow },
  jsonQuote = { fg = c.white },
  jsonMissingCommaError = { fg = c.red, reverse = true },
  jsonNoQuotesError = { fg = c.red, reverse = true },
  jsonNumError = { fg = c.red, reverse = true},
  jsonString = { fg = c.green },
  jsonStringSQError = { fg = c.red, reverse = true },
  jsonSemicolonError = { fg = c.red, reverse = true},
}

langs.markdown = {
  markdownBlockquote = { fg = c.comment_grey },
  markdownBold = { fg = c.dark_yellow, bold = true },
  markdownCode = { fg = c.green },
  markdownCodeBlock = { fg = c.green },
  markdownCodeDelimiter = { fg = c.green },
  markdownH1 = { fg = c.red },
  markdownH2 = { fg = c.red },
  markdownH3 = { fg = c.red },
  markdownH4 = { fg = c.red },
  markdownH5 = { fg = c.red },
  markdownH6 = { fg = c.red },
  markdownHeadingDelimiter = { fg = c.red },
  markdownHeadingRule = { fg = c.comment_grey },
  markdownId = { fg = c.purple },
  markdownIdDeclaration = { fg = c.blue },
  markdownIdDelimiter = { fg = c.purple },
  markdownItalic = { fg = c.purple, italic = true },
  markdownLinkDelimiter = { fg = c.purple },
  markdownLinkText = { fg = c.blue },
  markdownListMarker = { fg = c.red },
  markdownOrderedListMarker = { fg = c.red },
  markdownRule = { fg = c.comment_grey },
  markdownUrl = { fg = c.cyan, underline = true },
}

return langs
