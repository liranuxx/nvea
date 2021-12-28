--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Version: 0.1.0 - 2021/12/28
Maintainer: Li Ran
Website: https://gitee.com/liranux/nvim

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
vim.notify = require("notify")
local modules = {
  "core",
  "plugins",
}

for _, module in ipairs(modules) do
  local ok, _ = pcall(require, module)
  if not ok then
    vim.notify("Error loading "..module,{position="bot"},"error")
  end
end
