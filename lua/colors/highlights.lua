local c = require("colors").get()

local hl = {}

hl.highlighting = {
  ColorColumn = { bg = c.cursor_grey },
  Conceal = {},
  Cursor = { fg = c.black, bg = c.blue },
  CursorIM = {},
  CursorColumn = { bg = c.cursor_grey },
  CursorLine = { bg = c.cursor_grey },
  Directory = { fg = c.blue },
  DiffAdd = { bg = c.green, fg = c.black },
  DiffChange = { fg = c.yellow, underline = true },
  DiffDelete = { bg = c.red, fg = c.black },
  DiffText = { bg = c.yellow, fg = c.black },
  EndOfBuffer = { fg = c.black },
  ErrorMsg = { fg = c.red },
  VertSplit = { fg = c.vertsplit },
  Folded = { fg = c.comment_grey },
  FoldColumn = {},
  SignColumn = {},
  IncSearch = { fg = c.yellow, bg = c.comment_grey },
  LineNr = { fg = c.gutter_fg_grey },
  CursorLineNr = { fg = c.red},
  MatchParen = { fg = c.blue, underline = true },
  ModeMsg = {},
  MoreMsg = {},
  NonText = { fg = c.special_grey },
  Normal = { fg = c.foreground, bg = c.background },
  Pmenu = { fg = c.white, bg = c.background },
  PmenuSel = { fg = c.cursor_grey, bg = c.blue },
  PmenuSbar = { bg = c.background },
  PmenuThumb = { bg = c.white },
  Question = { fg = c.purple },
  QuickFixLine = { fg = c.black, bg = c.yellow },
  Search = { fg = c.visual_grey, bg = c.yellow },
  SpecialKey = { fg = c.special_grey },
  SpellBad = { fg = c.red, underline = true },
  SpellCap = { fg = c.dark_yellow },
  SpellLocal = { fg = c.dark_yellow },
  SpellRare = { fg = c.dark_yellow },
  StatusLine = { fg = c.white, bg = c.cursor_grey },
  StatusLineNC = { fg = c.comment_grey },
  StatusLineTerm = { fg = c.white, bg = c.cursor_grey },
  StatusLineTermNC = { fg = c.comment_grey },
  TabLine = { fg = c.comment_grey },
  TabLineFill = {},
  TabLineSel = { fg = c.white },
  Terminal = { fg = c.white, bg = c.black },
  Title = { fg = c.green },
  Visual = { bg = c.visual_grey },
  VisualNOS = { bg = c.visual_grey },
  WarningMsg = { fg = c.yellow },
  WildMenu = { fg = c.black, bg = c.blue },
  debugPC = { bg = c.special_grey },
  debugBreakpoint = { fg = c.black, bg = c.red },
  NormalFloat = {bg = c.background},
}

hl.syntax = {
  Comment = {fg = c.comment_grey, italic = true},
  Constant = {fg = c.cyan},
  String = {fg = c.green},
  Character = {fg = c.green},
  Number = {fg = c.dark_yellow},
  Boolean = {fg = c.dark_yellow},
  Float = {fg = c.dark_yellow},
  Identifier = {fg = c.red},
  Function = {fg = c.blue},
  Statement = {fg = c.purple},
  Conditional = {fg = c.purple},
  Repeat = {fg = c.purple},
  Label = {fg = c.purple},
  Operator = {fg = c.purple},
  Keyword = {fg = c.red},
  Exception = {fg = c.purple},
  PreProc = {fg = c.yellow},
  Include = {fg = c.blue},
  Define = {fg = c.purple},
  Macro = {fg = c.purple},
  PreCondit = {fg = c.yellow},
  Type = {fg = c.yellow},
  StorageClass = {fg = c.yellow},
  Structure = {fg = c.yellow},
  Typedef = {fg = c.yellow},
  Special = {fg = c.blue},
  SpecialChar = {fg = c.dark_yellow},
  Tag = {},
  Delimiter = {},
  SpecialComment = {fg = c.comment_grey},
  Debug = {},
  Underlined = {underline = true},
  Ignore = {},
  Error = {fg = c.red},
  Todo = {fg = c.purple}
}

hl.git = {
  gitcommitComment = { fg = c.comment_grey },
  gitcommitUnmerged = { fg = c.green },
  gitcommitOnBranch = {},
  gitcommitBranch = { fg = c.purple },
  gitcommitDiscardedType = { fg = c.red },
  gitcommitSelectedType = { fg = c.green },
  gitcommitHeader = {},
  gitcommitUntrackedFile = { fg = c.cyan },
  gitcommitDiscardedFile = { fg = c.red },
  gitcommitSelectedFile = { fg = c.green },
  gitcommitUnmergedFile = { fg = c.yellow },
  gitcommitFile = {},
  gitcommitSummary = { fg = c.white },
  gitcommitOverflow = { fg = c.red },
  gitcommitNoBranch = { fg = c.purple },
  gitcommitUntracked = { fg = c.comment_grey },
  gitcommitDiscarded = { fg = c.comment_grey },
  gitcommitSelected = { fg = c.comment_grey },
  gitcommitDiscardedArrow = { fg = c.red },
  gitcommitSelectedArrow = { fg = c.green },
  gitcommitUnmergedArrow = { fg = c.cyan },
}

hl.diagnostics = {
  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = c.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticUnderlineError = { fg = c.red, underline = true },
  DiagnosticUnderlineWarn = { fg = c.yellow, underline = true },
  DiagnosticUnderlineInfo = { fg = c.blue, underline = true},
  DiagnosticUnderlineHint = { fg = c.cyan, underline = true},
}

hl.lsp = {
  LspDiagnosticsDefaultError = { fg = c.red },
  LspDiagnosticsDefaultWarning = { fg = c.yellow },
  LspDiagnosticsDefaultInformation = { fg = c.blue },
  LspDiagnosticsDefaultHint = { fg = c.cyan },
  LspDiagnosticsUnderlineError = { fg = c.red, underline = true },
  LspDiagnosticsUnderlineWarning = { fg = c.yellow, underline = true },
  LspDiagnosticsUnderlineInformation = { fg = c.blue, underline = true },
  LspDiagnosticsUnderlineHint = { fg = c.cyan, underline = true },
}

hl.treesitter = {
  TSAnnotation = {fg = c.foreground},
  TSAttribute = {fg = c.cyan},
  TSBoolean = {fg = c.dark_yellow},
  TSCharacter = {fg = c.dark_yellow},
  TSComment = {fg = c.comment_grey, italic = true},
  TSConditional = {fg = c.purple},
  TSConstant = {fg = c.dark_yellow},
  TSConstBuiltin = {fg = c.dark_yellow},
  TSConstMacro = {fg = c.dark_yellow},
  TSConstructor = {fg = c.yellow, bold = true},
  TSError = {fg = c.foreground},
  TSException = {fg = c.purple},
  TSField = {fg = c.red},
  TSFloat = {fg = c.dark_yellow},
  TSFunction = {fg = c.blue},
  TSFuncBuiltin = {fg = c.cyan},
  TSFuncMacro = {fg = c.cyan},
  TSInclude = {fg = c.purple},
  TSKeyword = {fg = c.purple},
  TSKeywordFunction = {fg = c.purple, bold = true},
  TSKeywordOperator = {fg = c.purple},
  TSLabel = {fg = c.red},
  TSMethod = {fg = c.blue},
  TSNamespace = {fg = c.yellow},
  TSNone = {fg = c.foreground},
  TSNumber = {fg = c.dark_yellow},
  TSOperator = {fg = c.foreground},
  TSParameter = {fg = c.red},
  TSParameterReference = {fg = c.foreground},
  TSProperty = {fg = c.red},
  TSPunctDelimiter = {fg = c.white},
  TSPunctBracket = {fg = c.visual_grey},
  TSPunctSpecial = {fg = c.visual_grey},
  TSRepeat = {fg = c.purple},
  TSString = {fg = c.green},
  TSStringRegex = {fg = c.dark_yellow},
  TSStringEscape = {fg = c.red},
  TSSymbol = {fg = c.cyan},
  TSTag = {fg = c.red},
  TSTagDelimiter = {fg = c.red},
  TSText = {fg = c.foreground},
  TSStrong = {fg = c.foreground},
  TSEmphasis = {fg = c.foreground},
  TSUnderline = {fg = c.foreground},
  TSStrike = {fg = c.foreground},
  TSTitle = {fg = c.foreground},
  TSLiteral = {fg = c.green},
  TSURI = {fg = c.foreground},
  TSMath = {fg = c.foreground},
  TSTextReference = {fg = c.foreground},
  TSEnviroment = {fg = c.foreground},
  TSEnviromentName = {fg =c.foreground },
  TSNote = {fg = c.foreground},
  TSWarning = {fg = c.foreground},
  TSDanger = {fg = c.foreground},
  TSType = {fg = c.yellow},
  TSTypeBuiltin = {fg = c.dark_yellow},
  TSVariable = {fg = c.foreground},
  TSVariableBuiltin = {fg = c.red},
}

return hl
