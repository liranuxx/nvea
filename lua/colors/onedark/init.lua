local hl = require("colors.onedark.highlights")
local langs = require("colors.onedark.hl_langs")
local plugins = require("colors.onedark.hl_plugins")
local vim_highlights = require("colors.onedark.utils").vim_highlights

local M = {}
vim.g.onedark_style = vim.g.onedark_style or 'dark'
-- local terminal = require('onedark.terminal')

local function colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "onedark"
  for _, group in pairs(hl) do vim_highlights(group) end
  for _, group in pairs(langs) do vim_highlights(group) end
  for _, group in pairs(plugins) do vim_highlights(group) end
  -- terminal.setup()
end

function M.toggle()
    local styles = { 'dark', 'light'}
    local index={}
    for k,v in pairs(styles) do index[v]=k end
    vim.g.onedark_style = styles[index[vim.g.onedark_style] + 1] or 'dark'
    vim.cmd[[colorscheme onedark]]
 end

function M.setup() colorscheme() end

return M
