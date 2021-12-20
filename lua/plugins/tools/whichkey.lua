local present, whichkey = pcall(require, "which-key")
if not present then
  return print("Whichkey not present!!!")
end
whichkey.setup {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20
    }
  },
  window = {
    border = "single"
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB"
  }
}
require("plugins.tools.")
whichkey.register(
  {
    f = {
      name = "File",
      f = {"Find File"},
      b = {"Find Buffer"},
      a = {"Find Hidden File"},
      w = {"Find AllWord"},
      o = {"Find Recent File"},
      l = {"Find Function"},
      m = {"File Format"}
    },
    g = {
      name = "Git"
    },
    c = {
      name = "cmd",
      c = {"Find Cmd"},
      h = {"Find CmdHistory"}
    },
    e = {"Focu File On Tree"},
    q = {"Close Window"},
    w = {"Save File"},
    x = {"Close Buffer "},
    k = {"Close Window "},
    ["/"] = {"search chars"}
  },
  {prefix = "<leader>"}
)
whichkey.register(
  {
    ["<c-n>"] = {"Open File Tree"},
    ["<c-a>"] = {"Copy All File Context"},
    ["<F1>"] = {"Help"},
    ["<F2>"] = {"Toggle number"},
    ["<a-h>"] = {"Increase Width"},
    ["<a-j>"] = {"Decrease Height"},
    ["<a-k>"] = {"Increase Height"},
    ["<a-l>"] = {"Decrease Width"},
    ["<c-h>"] = {"Go to the Left Window"},
    ["<c-j>"] = {"Go to the Down Window"},
    ["<c-k>"] = {"Go to the Up Window"},
    ["<c-l>"] = {"Go to the Right Window"},
    g = {
      name = "Lsp",
      r = {"Rename"},
      x = {"Code Action"},
      p = {"Preview Define"},
      d = {"Goto Define"},
      e = {"Show Line Diag"},
      l = {"List Line Diag"},
      j = {"Jump Next Diag"},
      k = {"Jump Prev Diag"},
      h = {"Finder"}
    },
    K = {"Function Hover"},
    ["#"] = {"Search Up for the current word"},
    ["*"] = {"Search Down for the current word"}
  }
)
