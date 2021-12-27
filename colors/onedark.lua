local gc = require("colorschemes").get("onedark")
local space = " "
local cc = {
  black = gc.black,
  red = gc.red,
  green = gc.green,
  yellow = gc.yellow,
  blue = gc.blue,
  purple = gc.purple,
  cyan = gc.cyan,
  comment_grey = gc.comment_grey,
  visual_grey = gc.visual_grey,
  white = gc.white
}

vim.g.terrminal_color_0 = cc.black
vim.g.terminal_color_1 = cc.red
vim.g.terminal_color_2 = cc.green
vim.g.terminal_color_3 = cc.yellow
vim.g.terminal_color_4 = cc.blue
vim.g.terminal_color_5 = cc.purple
vim.g.terminal_color_6 = cc.cyan
vim.g.terminal_color_7 = cc.white
vim.g.terminal_color_8 = cc.visual_grey
vim.g.terminal_color_9 = cc.dark_red
vim.g.terminal_color_10 = cc.green
vim.g.terminal_color_11 = cc.dark_yellow
vim.g.terminal_color_12 = cc.blue
vim.g.terminal_color_13 = cc.purple
vim.g.terminal_color_14 = cc.cyan
vim.g.terminal_color_15 = cc.comment_grey
vim.g.terminal_color_background = cc.background
vim.g.terminal_color_foreground = cc.foreground

-- local onedark = {
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
-- }

local function mt(...)
  local all = {}
  for _, v in pairs({...}) do
    for e, a in pairs(v) do
      all[e] = a
    end
  end
  return all
end
local function fb(fg, bg)
  return {fg = fg, bg = bg}
end
local function f(fg)
  return {fg = fg}
end
local function b(bg)
  return {bg = bg}
end
-- local function p(sp)
--   return {sp = sp}
-- end
local function s(style)
  return {style = style}
end
-- local function cfb(fg,bg)
--   return {cfg = fg, cbg = bg}
-- end
-- local function cf(fg)
--   return {cfg = fg}
-- end
-- local function cb(bg)
--   return {cbg = bg}
-- end
local function cs(cstyle)
  return {style = cstyle}
end

-- styles
-- bold underline undercurl italic reverse
local function highlights(highlight)
  for name, settings in pairs(highlight) do
    local fg = settings.fg and "guifg=" .. settings.fg or "guifg=NONE"
    local bg = settings.bg and "guibg=" .. settings.bg or "guibg=NONE"
    local sp = settings.sp and "guisp=" .. settings.sp or "guisp=NONE"
    local style = settings.style and "gui=" .. settings.style or "gui=NONE"
    local cfg = settings.cfg and "ctermfg=" .. settings.cfg or "ctermfg=NONE"
    local cbg = settings.cbg and "ctermbg=" .. settings.cbg or "ctermbg=NONE"
    local cstyle = settings.cstyle and "cterm=" .. settings.cstyle or "cterm=NONE"
    local gui = space .. style .. space .. fg .. space .. bg .. space .. sp
    local cterm = space .. cstyle .. space .. cfg .. space .. cbg
    vim.cmd("highlight " .. name .. gui .. cterm)
  end
end
local hl = {
  common = {},
  syntax = {},
  langs = {},
  plugins = {},
  git = {},
  treesitter = {},
  transparency = {}
}

hl.common = {
  -- 背景颜色
  Normal = fb(gc.foreground, gc.background),
  Terminal = fb(gc.foreground, gc.background),
  NormalFloat = b(gc.black),
  FloatBorder = f(gc.blue),
  EndOfBuffer = f(gc.black),
  Cursor = fb(gc.black, gc.blue),
  CursorIM = {},
  ColorColumn = b(gc.cursor_grey),
  Conceal = {},
  CursorColumn = b(gc.cursor_grey),
  -- 当前行颜色
  CursorLine = b(gc.visual_grey),
  -- 当前行号颜色
  CursorLineNr = f(gc.red),
  -- 行颜色
  LineNr = f(gc.gutter_fg_grey),
  NvimTnternalError = f(gc.red),
  Directory = f(gc.blue),
  SignColumn = fb(gc.foreground, gc.background),
  Pmenu = b(gc.background),
  PmenuSel = fb(gc.cursor_grey, gc.blue),
  PmenuSbar = b(gc.background),
  PmenuThumb = b(gc.blue),
  Search = fb(gc.black, gc.yellow),
  IncSearch = fb(gc.yellow, gc.comment_grey),
  Question = f(gc.purple),
  QuickFixLine = fb(gc.black, gc.yellow),
  VertSplit = f(gc.vertsplit),
  Folded = f(gc.comment_grey),
  FoldColumn = {},
  -- '~' and '@' at the end of the window
  NonText = f(gc.special_grey),
  -- statusline 背景色
  StatusLine = fb(gc.foreground, gc.background),
  StatusLineNC = mt(f(gc.comment_grey), s("underline")),
  StatusLineTerm = fb(gc.foreground, gc.background),
  StatusLineTermNC = f(gc.comment_grey),
  DiffAdd = fb(gc.green, gc.black),
  DiffChange = fb(gc.yellow, gc.black),
  DiffDelete = fb(gc.red, gc.black),
  DiffText = fb(gc.yellow, gc.black),
  ErrorMsg = f(gc.red),
  WarningMsg = f(gc.yellow),
  -- 括号匹配颜色
  MatchParen = mt(f(gc.blue), s("underline"), cs("underline")),
  ModeMsg = {},
  SpecialKey = f(gc.special_grey),
  SpellBad = mt(f(gc.red), s("underline"), cs("underline")),
  SpellCap = f(gc.dark_yellow),
  SpellLocal = f(gc.dark_yellow),
  SpellRare = f(gc.dark_yellow),
  TabLine = f(gc.comment_grey),
  TabLineFill = {},
  TabLineSel = f(gc.white),
  Title = f(gc.green),
  Visual = mt(b("none"), s("inverse")),
  VisualNOS = mt(b("none"), s("inverse")),
  WildMenu = fb(gc.black, gc.blue)
}

local or_ita = function()
  local ita = require("core.config").ui.italic_comment
  if ita then
    return mt(f(gc.comment_grey), s("italic"), cs("italic"))
  else
    return f(gc.comment_grey)
  end
end
hl.syntax = {
  Comment = or_ita(),
  Constant = f(gc.cyan),
  String = f(gc.green),
  Character = f(gc.green),
  Number = f(gc.dark_yellow),
  Boolean = f(gc.dark_yellow),
  Float = f(gc.dark_yellow),
  Identifier = f(gc.red),
  Function = f(gc.blue),
  Statement = f(gc.purple),
  Conditional = f(gc.purple),
  Repeat = f(gc.purple),
  Label = f(gc.purple),
  Operator = f(gc.purple),
  Keyword = f(gc.red),
  Exception = f(gc.purple),
  PreProc = f(gc.yellow),
  Include = f(gc.blue),
  Define = f(gc.purple),
  Macro = f(gc.purple),
  PreCondit = f(gc.yellow),
  Type = f(gc.yellow),
  StorageClass = f(gc.yellow),
  Structure = f(gc.yellow),
  Typedef = f(gc.yellow),
  Special = f(gc.blue),
  SpecialChar = f(gc.dark_yellow),
  Tag = {},
  Delimiter = {},
  SpecialComment = f(gc.comment_grey),
  Debug = {},
  Underlined = mt(s("underline"), cs("underline")),
  Ignore = {},
  Error = f(gc.red),
  Todo = f(gc.purple),
  debugPC = b(gc.special_grey),
  debugBreakpoint = fb(gc.black, gc.red)
}

hl.treesitter = {
  -- TSFunction = f(gc.blue),
  -- TSKeywordFunction = f(gc.red);
  -- TSProperty = f(gc.);
  -- TSVariable = f(gc.cyan);
  TSTextReference = f(gc.cyan),
  -- 运算符颜色
  TSOperator = f(gc.extra.teal)
}

hl.langs.c = {
  cInclude = f(gc.blue),
  cStorageClass = f(gc.purple),
  cTypedef = f(gc.purple),
  cDefine = f(gc.cyan),
  cTSInclude = f(gc.blue),
  cTSConstant = f(gc.cyan),
  cTSConstMacro = f(gc.purple)
}

hl.langs.cpp = {
  cppStatement = mt(f(gc.purple), s("bold")),
  cppTSInclude = f(gc.blue),
  cppTSConstant = f(gc.cyan),
  cppTSConstMacro = f(gc.purple)
}

hl.langs.vim = {
  vimTSFuncMacro = mt(f(gc.cyan), s("bold")),
  vimCommentTitle = mt(f(gc.comment_grey), s("bold")),
  vimCommand = mt(f(gc.cyan), s("bold")),
  vimLet = f(gc.purple),
  vimFunction = f(gc.blue),
  vimIsCommand = f(gc.foreground),
  vimUserFunc = f(gc.blue),
  vimFuncName = f(gc.blue),
  vimMap = f(gc.purple),
  vimMapModKey = f(gc.dark_yellow),
  vimNotation = f(gc.red),
  vimMapLhs = f(gc.blue),
  vimMapRhs = f(gc.blue),
  vimOption = f(gc.red),
  vimUserAttrbKey = f(gc.red),
  vimUserAttrb = f(gc.blue),
  vimSynType = f(gc.cyan),
  vimHiBang = f(gc.purple),
  vimSet = f(gc.yellow),
  vimSetEqual = f(gc.yellow),
  vimSetSep = f(gc.comment_grey),
  vimVar = f(gc.foreground),
  vimFuncVar = f(gc.foreground),
  vimContinue = f(gc.comment_grey),
  vimAutoCmdSfxList = f(gc.cyan)
}

hl.langs.json = {
  jsonCommentError = f(gc.white),
  jsonKeyword = f(gc.red),
  jsonBoolean = f(gc.dark_yellow),
  jsonNumber = f(gc.dark_yellow),
  jsonQuote = f(gc.white),
  jsonMissingCommaError = mt(f(gc.red), s("reverse")),
  jsonNoQuotesError = mt(f(gc.red), s("reverse")),
  jsonNumError = mt(f(gc.red), s("reverse")),
  jsonString = f(gc.green),
  jsonStringSQError = mt(f(gc.red), s("reverse")),
  jsonSemicolonError = mt(f(gc.red), s("reverse"))
}

hl.langs.markdown = {
  markdownBlockquote = f(gc.comment_grey),
  markdownBold = mt(f(gc.dark_yellow), s("bold")),
  markdownCode = f(gc.green),
  markdownCodeBlock = f(gc.green),
  markdownCodeDelimiter = f(gc.green),
  markdownH1 = f(gc.red),
  markdownH2 = f(gc.red),
  markdownH3 = f(gc.red),
  markdownH4 = f(gc.red),
  markdownH5 = f(gc.red),
  markdownH6 = f(gc.red),
  markdownHeadingDelimiter = f(gc.red),
  markdownHeadingRule = f(gc.comment_grey),
  markdownId = f(gc.purple),
  markdownIdDeclaration = f(gc.blue),
  markdownIdDelimiter = f(gc.purple),
  markdownItalic = mt(f(gc.purple), s("italic")),
  markdownLinkDelimiter = f(gc.purple),
  markdownLinkText = f(gc.blue),
  markdownListMarker = f(gc.red),
  markdownOrderedListMarker = f(gc.red),
  markdownRule = f(gc.comment_grey),
  markdownUrl = mt(f(gc.cyan), s("underline"))
}

hl.git = {
  gitcommitComment = f(gc.comment_grey),
  gitcommitUnmerged = f(gc.green),
  gitcommitOnBranch = {},
  gitcommitBranch = f(gc.purple),
  gitcommitDiscardedType = f(gc.red),
  gitcommitSelectedType = f(gc.green),
  gitcommitHeader = {},
  gitcommitUntrackedFile = f(gc.cyan),
  gitcommitDiscardedFile = f(gc.red),
  gitcommitSelectedFile = f(gc.green),
  gitcommitUnmergedFile = f(gc.yellow),
  gitcommitFile = {},
  gitcommitSummary = f(gc.white),
  gitcommitOverflow = f(gc.red),
  gitcommitNoBranch = f(gc.purple),
  gitcommitUntracked = f(gc.comment_grey),
  gitcommitDiscarded = f(gc.comment_grey),
  gitcommitSelected = f(gc.comment_grey),
  gitcommitDiscardedArrow = f(gc.red),
  gitcommitSelectedArrow = f(gc.green),
  gitcommitUnmergedArrow = f(gc.cyan)
}

hl.plugins.lsp = {
  DiagnosticHint = f(gc.purple),
  DiagnosticError = f(gc.red),
  DiagnosticWarn = f(gc.yellow),
  DiagnosticInformation = f(gc.green),
  DiagnosticVirtualTextError = b(gc.black),
  DiagnosticLineNrError = mt(fb("#FF0000", "#51202A"), s("bold")),
  DiagnosticLineNrWarn = mt(fb("#FFA500", "#51412A"), s("bold")),
  DiagnosticLineNrInfo = mt(fb("#00FFFF", "#1E535D"), s("bold")),
  DiagnosticLineNrHint = mt(fb("#0000FF", "#1E205D"), s("bold"))
}

hl.plugins.cmp = {
  -- CmpDocumentation = fb(gc.foreground,gc.background),
  -- CmpDocumentationBorder = fb(gc.red,gc.blue),
  CmpItemAbbrDeprecated = mt(f(gc.white), s("strikethrough")),
  CmpItemKindSnippet = f("#BF616A"),
  CmpItemKindUnit = f("#D08770"),
  CmpItemKindProperty = f("#A3BE8C"),
  CmpItemKindKeyword = f("#EBCB8B"),
  CmpItemAbbrMatch = f("#5E81AC"),
  CmpItemAbbrMatchFuzzy = f("#5E81AC"),
  CmpItemKindVariable = f("#8FBCBB"),
  CmpItemKindInterface = f("#88C0D0"),
  CmpItemKindText = f("#81A1C1"),
  CmpItemKindFunction = f("#B48EAD"),
  CmpItemKindMethod = f("#B48EAD")
}

hl.plugins.gitgutter = {
  gitgutteradd = f(gc.green),
  gitgutterchange = f(gc.yellow),
  gitgutterdelete = f(gc.red)
}

hl.plugins.gitsigns = {
  gitsignsAdd = f(gc.green),
  gitsignsChange = f(gc.yellow),
  gitsiginsDelete = f(gc.red)
}

hl.plugins.telescope = {
  -- TelescopeBorder = {fg = c.blue},
  TelescopePromptTitle = fb(gc.red, gc.background),
  TelescopePromptBorder = f(gc.red),
  TelescopeResultsTitle = fb(gc.blue, gc.background),
  TelescopeResultsBorder = f(gc.blue),
  TelescopePreviewTitle = fb(gc.green, gc.background),
  TelescopePreviewBorder = f(gc.green),
  TelescopeMatching = mt(fb(gc.black, gc.dark_yellow), s("bold")),
  TelescopeSelection = f(gc.blue)
}

hl.plugins.nvimtree = {
  NvimTreeEndOfBuffer = f(gc.background),
  NvimTreeFolderIcon = f(gc.blue),
  NvimTreeOpenedFolderName = f(gc.red),
  NvimTreeNormal = fb(gc.foreground,gc.background),
  NvimTreeRootFolder = mt(f(gc.red), s("underline"))
}

hl.plugins.blankline = {
  IndentBlanklineChar = f(gc.purple)
}

hl.plugins.ts_rainbow = {
  rainbowcol1 = f(gc.cyan),
  rainbowcol2 = f(gc.purple),
  rainbowcol3 = f(gc.blue),
  rainbowcol4 = f(gc.dark_yellow),
  rainbowcol5 = f(gc.yellow),
  rainbowcol6 = f(gc.green),
  rainbowcol7 = f(gc.red)
}

hl.plugins.notification = {
  NotificationInfo = f(gc.green),
  NotificationWarning = f(gc.yellow),
  NotificationError = f(gc.red),
}

hl.transparency = {
  Normal = b("NONE"),
  SignColumn = b("NONE"),
  StatusLine = b("NONE"),
  StatusLineTerm = b("NONE"),

  Pmenu = b("NONE"),
  PmenuSbar = b("NONE"),

  NormalFloat = b("NONE"),
  NvimTreeNormal = b("NONE"),
  NvimTreeNormalNC = b("NONE"),
  NvimTreeStatusLineNC = b("NONE"),
  NvimTreeVertSplit = fb(gc.comment_grey, "NONE"),
  -- telescope
  TelescopeBorder = fb(gc.background, "NONE"),
  TelescopePrompt = b("NONE"),
  TelescopeResults = b("NONE"),
  TelescopePromptNormal = b("NONE"),
  TelescopeNormal = b("NONE"),
  TelescopePromptPrefix = b("NONE"),
  TelescopeResultsTitle = fb(gc.black, gc.blue),
  TelescopePreviewTitle = fb(gc.black, gc.green),
  TelescopePromptTitle = fb(gc.black, gc.red)
}

local function init()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "onedark"
  highlights(hl.common)
  highlights(hl.syntax)
  highlights(hl.git)
  highlights(hl.treesitter)
  for _, group in pairs(hl.plugins) do
    highlights(group)
  end
  local ts = require("core.config").ui.transparency
  if ts then
    highlights(hl.transparency)
  end
  vim.o.background = "dark"
end

init()
