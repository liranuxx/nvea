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
    working_sym = '💥', -- The symbol for a plugin being installed/updated
    error_sym = '🧨', -- The symbol for a plugin with an error in installation/updating
    done_sym = '🎉', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '🔥', -- The symbol for an unused plugin which was removed
    moved_sym = '🚀', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically
      prompt_border = "single",
   },
   git = {
      clone_timeout = 1000,
      -- default_url_format = 'https://hub.fastgit.org/%s',
   },
   auto_clean = true,
   compile_on_sync = true,
   auto_reload_compiled = true
}

return packer
