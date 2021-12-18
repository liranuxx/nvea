-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/liran/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/liran/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/liran/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/liran/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/liran/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("Comment").setup()' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://hub.fastgit.org/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://hub.fastgit.org/L3MON4D3/LuaSnip"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\1\2ž\1\0\0\5\0\t\0\0154\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\a\0003\4\6\0:\4\b\3>\2\2\1G\0\1\0\fmapping\1\0\1\ftimeout\3¬\2\1\2\0\0\ajk\nsetup\26Escape not present!!!\nprint\18better_escape\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/better-escape.nvim",
    url = "https://hub.fastgit.org/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { 'require("plugins.tools.bufferline")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://hub.fastgit.org/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://hub.fastgit.org/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://hub.fastgit.org/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://hub.fastgit.org/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://hub.fastgit.org/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://hub.fastgit.org/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://hub.fastgit.org/saadparwaiz1/cmp_luasnip"
  },
  ["feline.nvim"] = {
    config = { 'require("plugins.tools.statusline")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://hub.fastgit.org/famiu/feline.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://hub.fastgit.org/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://hub.fastgit.org/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.tools.gitsigns')" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://hub.fastgit.org/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://hub.fastgit.org/ellisonleao/glow.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2¿\4\0\0\5\0\16\0\0234\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\6\0003\4\a\0:\4\b\0033\4\t\0:\4\n\0033\4\v\0:\4\f\3>\2\2\0014\2\r\0007\2\14\2%\3\15\0>\2\2\1G\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh\bcmd\bvim\21context_patterns\1\15\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\ttype\bvar\vimport\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\b\0\0\thelp\rterminal\14dashboard\vpacker\flspinfo\20TelescopePrompt\21TelescopeResults\1\0\5\25show_current_context\2\28show_first_indent_level\2\tchar\bâ”Š\23indentLine_enabled\3\1#show_trailing_blankline_indent\2\nsetup\29Blankline not present!!!\nprint\21indent_blankline\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://hub.fastgit.org/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://hub.fastgit.org/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2§\1\0\0\4\0\a\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\6\0>\2\2\1G\0\1\0\1\0\2\29use_saga_diagnostic_sign\1\21code_action_icon\tï µ \nsetup\27Lspsaga not present!!!\nprint\flspsaga\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://hub.fastgit.org/tami5/lspsaga.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\2’\2\0\0\5\0\t\0\0154\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\a\0003\4\6\0:\4\b\3>\2\2\1G\0\1\0\rmappings\1\0\5\24use_local_scrolloff\1\22respect_scrolloff\1\16hide_cursor\2\25cursor_scrolls_alone\2\rstop_eof\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\29Neoscroll not present!!!\nprint\14neoscroll\frequire\npcall\0" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://hub.fastgit.org/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2}\0\0\4\0\6\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0012\3\0\0>\2\2\1G\0\1\0\nsetup\29Autopairs not present!!!\nprint\19nvim-autopairs\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://hub.fastgit.org/windwp/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-base16.lua",
    url = "https://hub.fastgit.org/liranuxx/nvim-base16.lua"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2‚\2\0\0\5\0\v\0\0184\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\6\0003\4\a\0>\2\3\0014\2\b\0007\2\t\2%\3\n\0>\2\2\1G\0\1\0\30ColorizerReloadAllBuffers\bcmd\bvim\1\0\t\vhsl_fn\1\tmode\15background\nnames\1\bcss\1\vRRGGBB\2\vrgb_fn\1\rRRGGBBAA\1\vcss_fn\1\bRGB\2\1\2\0\0\6*\nsetup\29Colorizer not present!!!\nprint\14colorizer\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://hub.fastgit.org/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://hub.fastgit.org/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "lspsaga.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFocus" },
    config = { 'require("plugins.tools.nvimtree")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://hub.fastgit.org/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://hub.fastgit.org/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://hub.fastgit.org/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://hub.fastgit.org/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://hub.fastgit.org/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://hub.fastgit.org/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://hub.fastgit.org/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://hub.fastgit.org/nvim-lua/popup.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://hub.fastgit.org/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugins.tools.telescope")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://hub.fastgit.org/nvim-telescope/telescope.nvim"
  },
  ["vim-cursorword"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/vim-cursorword",
    url = "https://hub.fastgit.org/itchyny/vim-cursorword"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins.tools.whichkey")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://hub.fastgit.org/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require("plugins.tools.statusline")
time([[Config for feline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("plugins.completion.lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.completion.cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("plugins.tools.whichkey")
time([[Config for which-key.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\2’\2\0\0\5\0\t\0\0154\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\a\0003\4\6\0:\4\b\3>\2\2\1G\0\1\0\rmappings\1\0\5\24use_local_scrolloff\1\22respect_scrolloff\1\16hide_cursor\2\25cursor_scrolls_alone\2\rstop_eof\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\29Neoscroll not present!!!\nprint\14neoscroll\frequire\npcall\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("Comment").setup()
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugins.tools.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.tools.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
require("plugins.tools.bufferline")

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\1\2}\0\0\4\0\6\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0012\3\0\0>\2\2\1G\0\1\0\nsetup\29Autopairs not present!!!\nprint\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")

vim.cmd [[ packadd lspsaga.nvim ]]

-- Config for: lspsaga.nvim
try_loadstring("\27LJ\1\2§\1\0\0\4\0\a\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\6\0>\2\2\1G\0\1\0\1\0\2\29use_saga_diagnostic_sign\1\21code_action_icon\tï µ \nsetup\27Lspsaga not present!!!\nprint\flspsaga\frequire\npcall\0", "config", "lspsaga.nvim")

vim.cmd [[ packadd lsp_signature.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
