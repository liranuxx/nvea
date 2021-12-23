local present, which_key = pcall(require, "which-key")
if not present then
  return print("Whichkey not present!!!")
end
which_key.setup {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20
    },
     presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
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
local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["e"] = { "Explorer" },
  ["o"] = { "Focu File On Explorer" },
  ["w"] = { "Save" },
  ["q"] = { "Quit" },
  ["x"] = { "Close Buffer" },
  ["k"] = { "Close Window" },
  ["/"] = { "Search Words" },

  ["<F2>"] = {"Toggle number"},
  ["<c-a>"] = {"Copy All File Context"},
  ["<a-h>"] = {"Increase Width"},
  ["<a-j>"] = {"Decrease Height"},
  ["<a-k>"] = {"Increase Height"},
  ["<a-l>"] = {"Decrease Width"},
  ["<c-h>"] = {"Go to the Left Window"},
  ["<c-j>"] = {"Go to the Down Window"},
  ["<c-k>"] = {"Go to the Up Window"},
  ["<c-l>"] = {"Go to the Right Window"},
  ["#"] = {"Search Up for the current word"},
  ["*"] = {"Search Down for the current word"},

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    S = { "<cmd>PackerSync<cr>", "Sync" },
    s = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

   g = {
    name = "Git",
    g = { "Lazygit" },
    j = { "Next Hunk" },
    k = { "Prev Hunk" },
    l = { "Blame" },
    p = { "Preview Hunk" },
    r = { "Reset Hunk" },
    R = { "Reset Buffer" },
    s = { "Stage Hunk" },
    u = { "Undo Stage Hunk" },
    o = { "Open changed file" },
    b = { "Checkout branch" },
    c = { "Checkout commit" },
    d = { "Diff" },
  },

  l = {
    name = "LSP",
    a = { "Code Action" },
    d = { "Document Diagnostics" },
    w = { "Workspace Diagnostics" },
    e = { "Show Line Diagnostics" },
    i = { "Info" },
    I = { "Installer Info" },
    j = { "Next Diagnostic" },
    k = { "Prev Diagnostic" },
    r = { "CodeLens Action" },
    l = { "Quickfix" },
    s = { "Signaturehelp Help" },
  },
  f = {
    name = "Find ",
    l = { "Builtin" },
    f = { "Find File" },
    a = { "Find Hide File" },
    b = { "Find Buffer" },
    w = { "Find Text" },
    s = { "Colorscheme" },
    H = { "Find Help" },
    h = { "Open Recent File" },
    R = { "Registers" },
    k = { "Keymaps" },
    c = { "Commands" },
    C = { "Commands History" },
  },

  t = {
    name = "Terminal",
    n = { "Node" },
    u = { "NCDU" },
    t = { "Htop" },
    g = { "Lazygit" },
    p = { "Python" },
    f = { "Float" },
    h = { "Horizontal" },
    v = { "Vertical" },
  },
}
which_key.register(mappings, opts)
