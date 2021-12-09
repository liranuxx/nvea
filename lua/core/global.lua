local global = {}
local home    = os.getenv("HOME")
-- local cmd = vim.cmd

local function what_is_system()
  if vim.fn.has('unix') == 1 then
    return 'unix'
  elseif vim.fn.has('win32') == 1 then
    return 'win'
  elseif vim.fn.has('mac') == 1 then
    return 'mac'
  else
    return 'unkonwn'
  end
end
local os_name = what_is_system()

function global:load_variables()

  if os_name == 'unkonwn' then
    local content = "This system not is win, unix or mac! error in lua/core/global"
    return error(content)
  else
    self.is_mac = 'mac' == os_name
    self.is_linux = 'unix' == os_name
    self.is_win = 'win' == os_name
  end
  local path_sep = global.is_win and '\\' or '/'
  self.vim_path = vim.fn.stdpath("config")
  self.cache_dir = home .. path_sep .. ".cache" .. path_sep.. "nvim"
  self.home = home
  self.path_sep = path_sep
  self.data_dir = vim.fn.stdpath("data") .. path_sep .. "site"
end

global:load_variables()

return global
