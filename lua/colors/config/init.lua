local hl = require("colors.config.highlights")
local langs = require("colors.config.hl_langs")
local plugins = require("colors.config.hl_plugins")
local vim_highlights = require("colors.config.utils").vim_highlights

local M = {}
-- local terminal = require('onedark.terminal')

local function colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  -- vim.g.colors_name = "onedark"
  for _, group in pairs(hl) do vim_highlights(group) end
  for _, group in pairs(langs) do vim_highlights(group) end
  for _, group in pairs(plugins) do vim_highlights(group) end
  -- terminal.setup()
end

function M.toggle()
  local styles = require("core.config").ui.toggle_theme
  local index={}
  for k,v in pairs(styles) do index[v]=k end
end

function M.setup() colorscheme() end

return M
