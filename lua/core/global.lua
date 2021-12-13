local global = {}
local home    = os.getenv("HOME")
local os_name = vim.loop.os_uname().sysname

function global:load_variables()

  self.home = home
  self.is_mac = "Darwin" == os_name
  self.is_linux = 'Linux' == os_name
  self.is_win = 'Windows' == os_name
  local path_sep = global.is_win and '\\' or '/'
  self.path_sep = path_sep

  self.vim_path = vim.fn.stdpath("config")
  self.cache_dir = home .. path_sep .. ".cache" .. path_sep.. "nvim"
  self.data_dir = vim.fn.stdpath("data") .. path_sep .. "site"
end

global:load_variables()

return global
