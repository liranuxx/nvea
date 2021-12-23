local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '
opt.whichwrap = 'b,s,<,>,[,],h,l'

opt.number = true
opt.numberwidth = 2
opt.cursorline = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.cmdheight = 1
vim.o.updatetime = 100

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartcase = true
opt.smarttab = true
opt.expandtab = true
opt.smartindent = true

opt.scrolloff = 5
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.list = true
opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"

opt.ignorecase = true
opt.smartcase = true
opt.breakindent = true
opt.completeopt = "menu,menuone,noselect"

-- 折叠
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true


-----------------------------------------------------------
-- Defaults
-----------------------------------------------------------
-- g.encoding = "UTF-8"
-- opt.ruler = true
-- opt.background = "dark"
-- opt.hidden = true
-- opt.hlsearch = true
-- opt.incsearch = true



-----------------------------------------------------------
-- Disable some builtin vim plugins
-----------------------------------------------------------
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

-----------------------------------------------------------
-- Others
-----------------------------------------------------------
opt.shadafile = ""
opt.shell = "/bin/zsh"
opt.lazyredraw = true
g.python3_host_prog = '/bin/python3'
vim.cmd ("set dict+=~/.config/nvim/dict/words")
