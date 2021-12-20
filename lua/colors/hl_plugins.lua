local c = require("colors.schemes."..vim.g.nvea_theme)

local plugins = {}

plugins.gitgutter = {
  gitgutteradd = { fg = c.green },
  gitgutterchange = { fg = c.yellow },
  gitgutterdelete = { fg = c.red },
}

plugins.gitsigns = {
  gitsignsAdd = { fg = c.green },
  gitsignsChange = { fg = c.yellow },
  gitsiginsDelete = { fg = c.red },
}

plugins.telescope = {
  -- TelescopeBorder = {fg = c.blue},
  TelescopePromptTitle = { fg = c.red, bg = c.background },
  TelescopePromptBorder = { fg = c.red },
  TelescopeResultsTitle = { fg = c.blue, bg = c.background },
  TelescopeResultsBorder = { fg = c.blue },
  TelescopePreviewTitle = { fg = c.green, bg = c.background },
  TelescopePreviewBorder = { fg = c.green },
  TelescopeMatching = { fg = c.yellow, bold = true },
}

plugins.nvimtree = {
  NvimTreeEndOfBuffer = { fg = c.background},
  NvimTreeFolderIcon = { fg = c.blue },
  NvimTreeOpenedFolderName = { fg = c.red },
  NvimTreeNormal = { bg = c.background },
  NvimTreeRootFolder = { fg = c.red, underline = true },
}

plugins.blankline = {
  IndentBlanklineChar = {fg = c.purple},
}

plugins.ts_rainbow = {
  rainbowcol1 = {fg = c.cyan},
  rainbowcol2 = {fg = c.purple},
  rainbowcol3 = {fg = c.blue},
  rainbowcol4 = {fg = c.dark_yellow},
  rainbowcol5 = {fg = c.yellow},
  rainbowcol6 = {fg = c.green},
  rainbowcol7 = {fg = c.red},
}
return plugins
