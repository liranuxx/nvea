local status, _ = pcall(require, "luasnip")
if not status then
  return print("Luasnip not found!!!")
end

require("luasnip/loaders/from_vscode").lazy_load()
