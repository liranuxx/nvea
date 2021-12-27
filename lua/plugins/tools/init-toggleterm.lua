local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return print("Toggleterm not found!")
end

require("toggleterm").setup({
  size = 20,
  open_mapping = [[<a-d>]],
  hide_numbers = true,
  start_in_insert = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "single",
    width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
    height = math.floor(vim.api.nvim_win_get_height(0) * 0.8),
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({cmd = "node", hidden = true})

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new({cmd = "ncdu", hidden = true})

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({cmd = "htop", hidden = true})

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({cmd = "python", hidden = true})

function _PYTHON_TOGGLE()
  python:toggle()
end
