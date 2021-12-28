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
local modules = {
  "core",
  "plugins",
  "myplugin"
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading " .. module .. "\n\n" .. err)
  end
end
