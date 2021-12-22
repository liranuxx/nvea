local modules = {
  "myplugin.prodoc",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading "..module.."\n\n"..err)
  end
end
