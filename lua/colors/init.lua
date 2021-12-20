vim.g.nvea_theme = require("core.config").ui.theme
local highlight = require("colors.utils").highlight
-- local terminal = require('onedark.terminal')

local function setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.g.colors_name = vim.g.nvea_theme
  highlight()
  -- terminal.setup()
end

setup()
