local present, whichkey = pcall(require, "which-key")
if not present then
  return print("Whichkey not present!!!")
end
whichkey.setup {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  window = {
    border = "single",
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
}
require("plugins.tools.")
whichkey.register({
  f = {
    name = "file",
    f = { "Find File" },
    b = { "Find Buffer" },
    a = { "Find HiddenFile" },
    w = { "Find AllWord" },
    o = { "Find OldFile" },
    l = { "Find Function" },
  },
  c = {
    name = "cmd",
    c = { "Find Cmd" },
    h = { "Find CmdHistory" },
  },
  e = { "Focu File On Tree" },
  q = { "Close Window" },
  w = { "Save File" },
  x = { "Close Buffer " },
  k = { "Close Window " },

  ["/"] = { "search chars" },
}, {prefix = "<leader>"})
