local global = require("core.global")
local sep = global.path_sep
local data_dir = global.data_dir
local install_path = data_dir..sep..'pack'..sep..'packer'..sep..'opt'..sep..'packer.nvim'

local state = vim.loop.fs_stat(install_path)
if not state then
  print("Packer cloning!")
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    "https://codechina.csdn.net/mirrors/wbthomason/packer.nvim",
    install_path})
end

vim.cmd [[packadd packer.nvim]]
local present, packer = pcall(require, "packer")
if not present then
  return print("Couldn't clone packer !\nPacker path: " .. install_path .. "\n" .. packer)
end

packer.init {
   max_job = 16,
   display = {
      open_fn = function()
         return require("packer.util").float({ border = "rounded" })
      end,
      prompt_border = "single",
   },
   git = {
      clone_timeout = 1000,
      default_url_format = 'https://hub.fastgit.org/%s',
   },
   auto_clean = true,
   compile_on_sync = true,
   auto_reload_compiled = true
}

return packer
