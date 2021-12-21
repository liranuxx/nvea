local c = require("colorschemes").get()
-- local c = {
--   red = "#E06C75",
--   dark_red = "#BE5046",
--   green = "#98C379",
--   yellow = "#E5C07B",
--   dark_yellow = "#d19a66",
--   blue = "#61AFEF",
--   purple = "#C678DD",
--   cyan = "#56B6C2",
--   white = "#ABB2BF",
--   black = "#282C34",
--   foreground = "#ABB2BF",
--   background = "#282C34",
--   comment_grey = "#5C6370",
--   gutter_fg_grey = "#4B5263",
--   cursor_grey = "#2C323C",
--   visual_grey = "#3E4452",
--   menu_grey = "#3E4452",
--   special_grey = "#3B4048",
--   vertsplit = "#3E4452",
--   extra = {
--     teal = "#519ABA",
--     pink = "#ff75a0",
--     dark_purple = "#8a3fa0",
--     dark_cyan = "#2b6f77",
--     bg1 = "#31353f",
--     bg2 = "#393f4a",
--     bg3 = "#3b3f4c",
--     bg_d = "#21252b",
--     bg_blue = "#73b8f1",
--     bg_yellow = "#ebd09c",
--     light_grey = "#848b98",
--   },
-- }

local function MergeTable(a,b)
  for k, v in pairs(b) do a[k] = v end
  return a
end
local function hlfb(fg,bg)
  return {fg = fg, bg = bg}
end
local function hlf(fg)
  return {fg = fg}
end
local function hlb(bg)
  return {bg = bg}
end

local function gui(gui_settings)
  if gui_settings.bold then return "bold"
  elseif gui_settings.underline then return "underline"
  elseif gui_settings.undercurl then return "undercurl"
  elseif gui_settings.italic then return "italic"
  elseif gui_settings.reverse then return "reverse"
  else return "NONE" end
end

local function highlights(highlights)
  for name, settings in pairs(highlights) do
    local fg = settings.fg and "guifg=" .. settings.fg or "guifg=NONE"
    local bg = settings.bg and "guibg=" .. settings.bg or "guibg=NONE"
    local sp = settings.sp and "guisp=" .. settings.sp or "guisp=NONE"
    vim.cmd("highlight "..name.." ".."gui="..gui(settings).." "..fg .." "..bg.." "..sp)
  end
end
local hl = {
  common = {},
  syntax = {},
  langs = {},
  plugins = {},
  git = {},
  treesitter = {},
}

hl.common = {
  -- 背景颜色
  Normal = hlfb(c.foreground, c.background),
  EndOfBuffer = hlfb(c.black),
  -- Cursor = hlfb(c.red, c.red),
  -- ColorColumn = hlb(c.cursor_grey),
  -- CursorColumn = hlb(c.cursor_grey),
  -- 当前行颜色
  CursorLine = hlb(c.cursor_wrey),
  -- 当前行号颜色
  CursorLineNr = hlf(c.red),
  -- 行号颜色
  LineNr = hlf(c.gutter_fg_grey),
  SignColumn = hlb(c.black),


  Pmenu = hlfb(c.white, c.background),
  PmenuSel = hlfb(c.cursor_grey, c.blue),
  PmenuSbar = hlb(c.background),
  PmenuThumb = hlb(c.white),


  Search = hlfb(c.visual_grey, c.yellow),
  VertSplit = hlf(c.vertsplit),


  StatusLine = hlfb(c.white, c.cursor_grey),
  StatusLineNC = hlf(c.comment_grey),
  StatusLineTerm = hlfb(c.white, c.cursor_grey),
  StatusLineTermNC = hlf(c.comment_grey),



  DiffAdd = hlfb(c.green, c.black),
  DiffChange = MergeTable(hlf(c.yellow), {underline = true}),
  DiffDelete = hlfb(c.red, c.black),
  DiffText = hlfb(c.yellow, c.black),
}

hl.syntax = {
  Comment = MergeTable(hlf(c.comment_grey),{italic = true}),
  Constant = hlf(c.cyan),
  String = hlf(c.green),
  Character = hlf(c.green),
  Number = hlf(c.dark_yellow),
  Boolean = hlf(c.dark_yellow),
  Float = hlf(c.dark_yellow),
  Identifier = hlf(c.red),
  Function = hlf(c.blue),
  Statement = hlf(c.purple),
  Conditional = hlf(c.purple),
  Repeat = hlf(c.purple),
  Label = hlf(c.purple),
  Operator = hlf(c.purple),
  Keyword = hlf(c.red),
  Exception = hlf(c.purple),
  PreProc = hlf(c.yellow),
  Include = hlf(c.blue),
  Define = hlf(c.purple),
  Macro = hlf(c.purple),
  PreCondit = hlf(c.yellow),
  Type = hlf(c.yellow),
  StorageClass = hlf(c.yellow),
  Structure = hlf(c.yellow),
  Typedef = hlf(c.yellow),
  Special = hlf(c.blue),
  SpecialChar = hlf(c.dark_yellow),
  Tag = {},
  Delimiter = {},
  SpecialComment = hlf(c.comment_grey),
  Debug = {},
  Underlined = {underline = true},
  Ignore = {},
  Error = hlf(c.red),
  Todo = hlf(c.purple),
}

hl.langs.c = {
  cInclude = hlf(c.blue),
  cStorageClass = hlf(c.purple),
  cTypedef = hlf(c.purple),
  cDefine = hlf(c.cyan),
  cTSInclude = hlf(c.blue),
  cTSConstant = hlf(c.cyan),
  cTSConstMacro = hlf(c.purple),
}

hl.langs.cpp = {
  cppStatement = MergeTable(hlf(c.purple), {bold = true}),
  cppTSInclude = hlf(c.blue),
  cppTSConstant = hlf(c.cyan),
  cppTSConstMacro = hlf(c.purple),
}

hl.langs.vim = {
  vimTSFuncMacro = MergeTable(hlf(c.cyan), {bold = true}),
  vimCommentTitle = MergeTable(hlf(c.comment_grey), {bold = true}),
  vimCommand = MergeTable(hlf(c.cyan), {bold = true}),
  vimLet = hlf(c.purple),
  vimFunction = hlf(c.blue),
  vimIsCommand = hlf(c.foreground),
  vimUserFunc = hlf(c.blue),
  vimFuncName = hlf(c.blue),
  vimMap = hlf(c.purple),
  vimMapModKey = hlf(c.dark_yellow),
  vimNotation = hlf(c.red),
  vimMapLhs = hlf(c.blue),
  vimMapRhs = hlf(c.blue),
  vimOption = hlf(c.red),
  vimUserAttrbKey = hlf(c.red),
  vimUserAttrb = hlf(c.blue),
  vimSynType = hlf(c.cyan),
  vimHiBang = hlf(c.purple),
  vimSet = hlf(c.yellow),
  vimSetEqual = hlf(c.yellow),
  vimSetSep = hlf(c.comment_grey),
  vimVar = hlf(c.foreground),
  vimFuncVar = hlf(c.foreground),
  vimContinue = hlf(c.comment_grey),
  vimAutoCmdSfxList = hlf(c.cyan),
}

hl.langs.json = {
  jsonCommentError = hlf(c.white),
  jsonKeyword = hlf(c.red),
  jsonBoolean = hlf(c.dark_yellow),
  jsonNumber = hlf(c.dark_yellow),
  jsonQuote = hlf(c.white),
  jsonMissingCommaError = MergeTable(hlf(c.red), {reverse = true}),
  jsonNoQuotesError = MergeTable(hlf(c.red), {reverse = true}),
  jsonNumError = MergeTable(hlf(c.red), {reverse = true}),
  jsonString = hlf(c.green),
  jsonStringSQError = MergeTable(hlf(c.red), {reverse = true}),
  jsonSemicolonError = MergeTable(hlf(c.red), {reverse = true}),
}

hl.langs.markdown = {
  markdownBlockquote = hlf(c.comment_grey),
  markdownBold = MergeTable(hlf(c.dark_yellow), {bold = true}),
  markdownCode = hlf(c.green),
  markdownCodeBlock = hlf(c.green),
  markdownCodeDelimiter = hlf(c.green),
  markdownH1 = hlf(c.red),
  markdownH2 = hlf(c.red),
  markdownH3 = hlf(c.red),
  markdownH4 = hlf(c.red),
  markdownH5 = hlf(c.red),
  markdownH6 = hlf(c.red),
  markdownHeadingDelimiter = hlf(c.red),
  markdownHeadingRule = hlf(c.comment_grey),
  markdownId = hlf(c.purple),
  markdownIdDeclaration = hlf(c.blue),
  markdownIdDelimiter = hlf(c.purple),
  markdownItalic = MergeTable(hlf(c.purple), {italic = true}),
  markdownLinkDelimiter = hlf(c.purple),
  markdownLinkText = hlf(c.blue),
  markdownListMarker = hlf(c.red),
  markdownOrderedListMarker = hlf(c.red),
  markdownRule = hlf(c.comment_grey),
  markdownUrl = MergeTable(hlf(c.cyan), {underline = true}),
}

hl.git = {
  gitcommitComment = hlf(c.comment_grey),
  gitcommitUnmerged = hlf(c.green),
  gitcommitOnBranch = {},
  gitcommitBranch = hlf(c.purple),
  gitcommitDiscardedType = hlf(c.red),
  gitcommitSelectedType = hlf(c.green),
  gitcommitHeader = {},
  gitcommitUntrackedFile = hlf(c.cyan),
  gitcommitDiscardedFile = hlf(c.red),
  gitcommitSelectedFile = hlf(c.green),
  gitcommitUnmergedFile = hlf(c.yellow),
  gitcommitFile = {},
  gitcommitSummary = hlf(c.white),
  gitcommitOverflow = hlf(c.red),
  gitcommitNoBranch = hlf(c.purple),
  gitcommitUntracked = hlf(c.comment_grey),
  gitcommitDiscarded = hlf(c.comment_grey),
  gitcommitSelected = hlf(c.comment_grey),
  gitcommitDiscardedArrow = hlf(c.red),
  gitcommitSelectedArrow = hlf(c.green),
  gitcommitUnmergedArrow = hlf(c.cyan),
}

hl.plugins.gitgutter = {
  gitgutteradd = hlf(c.green),
  gitgutterchange = hlf(c.yellow),
  gitgutterdelete = hlf(c.red),
}

hl.plugins.gitsigns = {
  gitsignsAdd = hlf(c.green),
  gitsignsChange = hlf(c.yellow),
  gitsiginsDelete = hlf(c.red),
}

hl.plugins.telescope = {
  -- TelescopeBorder = {fg = c.blue},
  TelescopePromptTitle = hlfb(c.red, c.background ),
  TelescopePromptBorder = hlf(c.red ),
  TelescopeResultsTitle = hlfb(c.blue, c.background ),
  TelescopeResultsBorder = hlf(c.blue ),
  TelescopePreviewTitle = hlfb(c.green, c.background ),
  TelescopePreviewBorder = hlf(c.green ),
  TelescopeMatching = MergeTable(hlf(c.yellow), {bold = true}),
}

hl.plugins.nvimtree = {
  NvimTreeEndOfBuffer = hlf(c.background),
  NvimTreeFolderIcon = hlf(c.blue),
  NvimTreeOpenedFolderName = hlf(c.red),
  NvimTreeNormal = hlb(c.background),
  NvimTreeRootFolder = MergeTable(hlf(c.red), {underline = true}),
}

hl.plugins.blankline = {
  IndentBlanklineChar = hlf(c.purple),
}

hl.plugins.ts_rainbow = {
  rainbowcol1 = hlf(c.cyan),
  rainbowcol2 = hlf(c.purple),
  rainbowcol3 = hlf(c.blue),
  rainbowcol4 = hlf(c.dark_yellow),
  rainbowcol5 = hlf(c.yellow),
  rainbowcol6 = hlf(c.green),
  rainbowcol7 = hlf(c.red),
}

local function init()
  vim.o.background = "dark"
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.g.colors_name = "onedark"
  highlights(hl.common)
  highlights(hl.syntax)
  highlights(hl.git)
  for _, group in pairs(hl.plugins) do highlights(group) end
  -- for _, group in pairs(plugins) do highlights(group) end
  -- for _, group in pairs(langs) do highlights(group) end
end

init()
