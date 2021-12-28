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
    config = { "\27LJ\1\2l\0\0\4\0\6\0\f4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\1>\2\1\1G\0\1\0\nsetup\23Comment not found!\nprint\fComment\frequire\npcall\0" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://hub.fastgit.org/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://hub.fastgit.org/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { 'require("plugins.tools.init-bufferline")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://hub.fastgit.org/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://hub.fastgit.org/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://hub.fastgit.org/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://hub.fastgit.org/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://hub.fastgit.org/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://hub.fastgit.org/saadparwaiz1/cmp_luasnip"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/far.vim",
    url = "https://hub.fastgit.org/brooth/far.vim"
  },
  ["formatter.nvim"] = {
    config = { 'require("plugins.lsp.init-formatter")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://hub.fastgit.org/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://hub.fastgit.org/rafamadriz/friendly-snippets"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://hub.fastgit.org/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.tools.init-gitsigns')" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://hub.fastgit.org/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\1\2”\1\0\0\4\0\a\0\0164\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0004\2\1\0%\3\2\0>\2\2\0027\2\5\0023\3\6\0>\2\2\1G\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\19Hop not found!\nprint\bhop\frequire\npcall\0" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://hub.fastgit.org/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2Æ\4\0\0\5\0\16\0\0234\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\6\0003\4\a\0:\4\b\0033\4\t\0:\4\n\0033\4\v\0:\4\f\3>\2\2\0014\2\r\0007\2\14\2%\3\15\0>\2\2\1G\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh\bcmd\bvim\21context_patterns\1\15\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\ttype\bvar\vimport\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\b\0\0\thelp\rterminal\14dashboard\vpacker\flspinfo\20TelescopePrompt\21TelescopeResults\1\0\5\25show_current_context\2\28show_first_indent_level\2\tchar\bâ”Š\23indentLine_enabled\3\1#show_trailing_blankline_indent\2\nsetup$Indent_Blankline not present!!!\nprint\21indent_blankline\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://hub.fastgit.org/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("plugins.tools.init-lualine")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://hub.fastgit.org/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\1\2p\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Qlet g:mkdp_browser = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://hub.fastgit.org/iamcco/markdown-preview.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\2’\2\0\0\5\0\t\0\0154\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\a\0003\4\6\0:\4\b\3>\2\2\1G\0\1\0\rmappings\1\0\5\24use_local_scrolloff\1\22respect_scrolloff\1\16hide_cursor\2\25cursor_scrolls_alone\2\rstop_eof\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\29Neoscroll not present!!!\nprint\14neoscroll\frequire\npcall\0" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://hub.fastgit.org/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2}\0\0\4\0\6\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0012\3\0\0>\2\2\1G\0\1\0\nsetup\29Autopairs not present!!!\nprint\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://hub.fastgit.org/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lua", "cmp-buffer", "cmp_luasnip", "cmp-path" },
    loaded = true,
    only_config = true
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://hub.fastgit.org/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2†\2\0\0\5\0\v\0\0194\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\4€4\2\3\0%\3\4\0@\2\2\0T\2\b€7\2\5\0013\3\6\0003\4\a\0>\2\3\0014\2\b\0007\2\t\2%\3\n\0>\2\2\1G\0\1\0\30ColorizerReloadAllBuffers\bcmd\bvim\1\0\t\vhsl_fn\1\tmode\15background\nnames\1\bcss\1\vRRGGBB\2\vrgb_fn\1\rRRGGBBAA\1\vcss_fn\1\bRGB\2\1\2\0\0\6*\nsetup\29Colorizer not present!!!\nprint\14colorizer\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://hub.fastgit.org/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    config = { 'require("plugins.lsp.lsp_installer")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://hub.fastgit.org/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("plugins.lsp.lspconfig")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://hub.fastgit.org/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://hub.fastgit.org/rcarriga/nvim-notify"
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
    after = { "nvim-treesitter-context" },
    config = { 'require("plugins.ui.treesitter")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://hub.fastgit.org/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { '\27LJ\1\2†\1\0\0\4\0\6\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0012\3\0\0>\2\2\1G\0\1\0\nsetup"Treesitter-context not found!\nprint\23treesitter-context\frequire\npcall\0' },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://hub.fastgit.org/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://hub.fastgit.org/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://hub.fastgit.org/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
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
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://hub.fastgit.org/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://hub.fastgit.org/ahmedkhalf/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugins.tools.init-telescope")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://hub.fastgit.org/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require("plugins.tools.init-toggleterm")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://hub.fastgit.org/akinsho/toggleterm.nvim"
  },
  ["vim-cursorword"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/liran/.local/share/nvim/site/pack/packer/opt/vim-cursorword",
    url = "https://hub.fastgit.org/itchyny/vim-cursorword"
  },
  ["vim-fzf-dictionary"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/vim-fzf-dictionary",
    url = "https://hub.fastgit.org/yuki-uthman/vim-fzf-dictionary"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://hub.fastgit.org/tpope/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://hub.fastgit.org/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins.tools.whichkey")' },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://hub.fastgit.org/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vwilder\22plugins.ui.config\frequire\0" },
    loaded = true,
    path = "/home/liran/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://hub.fastgit.org/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\1\2”\1\0\0\4\0\a\0\0164\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0004\2\1\0%\3\2\0>\2\2\0027\2\5\0023\3\6\0>\2\2\1G\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\19Hop not found!\nprint\bhop\frequire\npcall\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugins.tools.init-telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.completion.cmp")
time([[Config for nvim-cmp]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vwilder\22plugins.ui.config\frequire\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\2’\2\0\0\5\0\t\0\0154\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0013\3\a\0003\4\6\0:\4\b\3>\2\2\1G\0\1\0\rmappings\1\0\5\24use_local_scrolloff\1\22respect_scrolloff\1\16hide_cursor\2\25cursor_scrolls_alone\2\rstop_eof\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\29Neoscroll not present!!!\nprint\14neoscroll\frequire\npcall\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require("plugins.tools.init-toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.tools.init-gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require("plugins.lsp.init-formatter")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
require("plugins.lsp.lsp_installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\2l\0\0\4\0\6\0\f4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\1>\2\1\1G\0\1\0\nsetup\23Comment not found!\nprint\fComment\frequire\npcall\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2}\0\0\4\0\6\0\r4\0\0\0004\1\1\0%\2\2\0>\0\3\3\14\0\0\0T\2\3€4\2\3\0%\3\4\0@\2\2\0007\2\5\0012\3\0\0>\2\2\1G\0\1\0\nsetup\29Autopairs not present!!!\nprint\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("plugins.tools.whichkey")
time([[Config for which-key.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
require("plugins.tools.init-lualine")

vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
require("plugins.tools.init-bufferline")

vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
