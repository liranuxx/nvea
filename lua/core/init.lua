local modules = {
  "core.options",
  "core.autocmds",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading "..module.."\n\n"..err)
  end
end

-- set all thn non plugin mappings
require("core.mappings").init()
