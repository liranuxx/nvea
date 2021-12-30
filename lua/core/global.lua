local home    = os.getenv("HOME")
local os_name = vim.loop.os_uname().sysname
local is_mac = "Darwin" == os_name
local is_linux = 'Linux' == os_name
local is_win = 'Windows' == os_name
local path_sep = is_win and '\\' or '/'

local global = {
  home = home,
  os_name = os_name,
  is_linux = is_linux,
  is_win = is_win,
  is_mac = is_mac,
  path_sep = path_sep,

  nvim = vim.fn.stdpath("config"),
  cache = home .. path_sep .. ".cache" .. path_sep.. "nvim",
  data = vim.fn.stdpath("data"),
  site = vim.fn.stdpath("data") .. path_sep .. "site",
}
return global
