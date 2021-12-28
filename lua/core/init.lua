vim.cmd("colorscheme " .. require("core.config").ui.theme)
vim.notify({
  "😊 Now is "..vim.fn.strftime("%H:%M:%S", vim.fn.localtime()),
  "☕ Enjoy in your time!"
})

local modules = {
  "core.options",
  "core.autocmds"
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading " .. module .. "\n\n" .. err)
  end
end

-- set all the mappings
require("core.mappings").init()
