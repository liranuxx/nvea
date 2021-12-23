local present, which_key = pcall(require, "which-key")
if not present then
  return print("Whichkey not present!!!")
end
which_key.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = false,
      z = true,
      g = true
    }
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB"
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
    padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = {min = 4, max = 25}, -- min and max height of the columns
    width = {min = 20, max = 50}, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left" -- align columns left, center or right
  },
  ignore_missing = true,
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "@"},
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = {"j", "k"},
    v = {"j", "k"}
  }
}
local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true
}

local mappings = {
  ["e"] = {"Explorer"},
  ["o"] = {"Focu File On Explorer"},
  ["w"] = {"Save"},
  ["q"] = {"Quit"},
  ["x"] = {"Close Buffer"},
  ["k"] = {"Close Window"},
  ["/"] = {"Search Words"},
  p = {
    name = "Packer",
    c = {"<cmd>PackerCompile<cr>", "Compile"},
    i = {"<cmd>PackerInstall<cr>", "Install"},
    S = {"<cmd>PackerSync<cr>", "Sync"},
    s = {"<cmd>PackerStatus<cr>", "Status"},
    u = {"<cmd>PackerUpdate<cr>", "Update"}
  },
  g = {
    name = "Git",
    g = {"Lazygit"},
    j = {"Next Hunk"},
    k = {"Prev Hunk"},
    l = {"Blame"},
    p = {"Preview Hunk"},
    r = {"Reset Hunk"},
    R = {"Reset Buffer"},
    s = {"Stage Hunk"},
    u = {"Undo Stage Hunk"},
    o = {"Open changed file"},
    b = {"Checkout branch"},
    c = {"Checkout commit"},
    d = {"Diff"}
  },
  l = {
    name = "LSP",
    a = {"Code Action"},
    d = {"Document Diagnostics"},
    w = {"Workspace Diagnostics"},
    e = {"Show Line Diagnostics"},
    i = {"Info"},
    I = {"Installer Info"},
    j = {"Next Diagnostic"},
    k = {"Prev Diagnostic"},
    r = {"CodeLens Action"},
    l = {"Quickfix"},
    s = {"Signaturehelp Help"}
  },
  f = {
    name = "Find ",
    l = {"Builtin"},
    f = {"Find File"},
    a = {"Find Hide File"},
    b = {"Find Buffer"},
    w = {"Find Text"},
    s = {"Colorscheme"},
    H = {"Find Help"},
    h = {"Open Recent File"},
    R = {"Registers"},
    k = {"Keymaps"},
    c = {"Commands"},
    C = {"Commands History"}
  },
  t = {
    name = "Terminal",
    n = {"Node"},
    u = {"NCDU"},
    t = {"Htop"},
    g = {"Lazygit"},
    p = {"Python"},
    f = {"Float"},
    h = {"Horizontal"},
    v = {"Vertical"}
  }
}
local nop_mappings = {
  ["<F2>"] = {"Toggle number"},
  ["<C-a>"] = {"Copy All File Context"},
  ["<A-h>"] = {"Increase Width"},
  ["<A-j>"] = {"Decrease Height"},
  ["<A-k>"] = {"Increase Height"},
  ["<A-l>"] = {"Decrease Width"},
  ["<C-h>"] = {"Go to the Left Window"},
  ["<C-j>"] = {"Go to the Down Window"},
  ["<C-k>"] = {"Go to the Up Window"},
  ["<C-l>"] = {"Go to the Right Window"},
  ["#"] = {"Search Up for the current word"},
  ["*"] = {"Search Down for the current word"},
}
which_key.register(mappings, opts)
which_key.register(nop_mappings)
