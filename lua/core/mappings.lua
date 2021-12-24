local utils = require("core.utils")
local map = utils.map
local basic = require("core.config").basic
local maps = require("core.config").mappings
local plugin_maps = maps.plugins

local M = {}

local function non_config_mappings()
  -- Don't copy the replaced text after pasting in visual mode
  -- 在可视模式下粘贴后不复制被替换的文本
  map("v", "p", '"_dP')
  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- 允许光标移动通过折叠行
  map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
  map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})
  map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
  map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})
  -- use ESC to turn off search highlighting
  -- 使用<esc>关闭搜索高亮
  map({"n", "i"}, "<Esc>", "<Esc>:noh <CR>")
  -- yank from current cursor to end of line
  -- 从当前光标复制到行尾
  map("n", "Y", "yg$")
  -- Normal和Visual下，使用H, L表示到达行首，行尾
  map({"n", "v"}, "H", "^")
  map({"n", "v"}, "L", "$")
  map("n", "n", "nzz")
  map("n", "N", "Nzz")
  map("n", "*", "*zz")
  map("n", "#", "#zz")
  map("n", "g*", "g*zz")
  -- Visual下，移动当前行
  map("v", "J", ":m '>+1<cr>gv=gv")
  map("v", "K", ":m '<-2<cr>gv=gv")
end

local function optional_mappings()
  -- don't yank text on cut ( x )
  -- 剪切时不复制文本
  if not basic.copy_cut then
    map({"n", "v"}, "x", '"_x')
  end
  -- don't yank text on delete ( dd )
  -- 删除时不复制文本
  if not basic.copy_del then
    map({"n", "v"}, "d", '"_d')
  end
  -- navigation within insert mode
  -- 快速在Insert下移动
  if basic.insert_nav then
    local inav = maps.nv.insert_nav
    map("i", inav.backward, "<Left>")
    map("i", inav.end_of_line, "<End>")
    map("i", inav.forward, "<Right>")
    map("i", inav.next_line, "<Up>")
    map("i", inav.prev_line, "<Down>")
    map("i", inav.beginning_of_line, "<ESC>^i")
  end
  -- navigation within cmd mode
  -- 快速在Cmdline下移动
  if basic.cmd_nav then
    local cnav = maps.nv.cmd_nav
    map("c", cnav.backward, "<Left>")
    -- map("c",cnav.forward,"<Right>")
    -- map("c",cnav.beginning_of_line,"<Home>")
    map("c", cnav.endding_of_line, "<End>")
    -- map("c", cnav.sudow, "w !sudo tee>/dev/null %")
  end
  -- easier navigation between windows
  -- 快速在窗口中移动或者改变大小
  if basic.window_nav then
    local wnav = maps.nv.window_nav
    map("n", wnav.moveLeft, "<C-w>h")
    map("n", wnav.moveRight, "<C-w>l")
    map("n", wnav.moveUp, "<C-w>k")
    map("n", wnav.moveDown, "<C-w>j")
    map("n", wnav.addHeight, "<C-w>+")
    map("n", wnav.delHeight, "<C-w>-")
    map("n", wnav.addWidth, "<C-w>>")
    map("n", wnav.delWidth, "<C-w><")
  end
end

local function required_mappings()
  map("n", maps.close_window, "<c-w>q") -- close  window
  map("n", maps.close_buffer, ":bd <CR>") -- close  buffer
  map("n", maps.copy_whole_file, ":%y+ <CR>") -- copy whole file content
  map("n", maps.new_buffer, ":enew <CR>") -- new buffer
  map("n", maps.new_tab, ":tabnew <CR>") -- new tabs
  map("n", maps.line_number_toggle, ":set nu! <CR>") -- toggle numbers
  map("n", maps.save_file, ":w <CR>") -- save file
  map("n", maps.quit_file, ":q! <CR>") -- quit file
  -- map("n", maps.save_quit_file, ":wq! <CR>") -- save and quit file
  map("n", maps.toggle_theme, ":lua require('myplugin.toggle_theme')<cr>")
  map("n", maps.select_cmd, ":lua require('myplugin.select_cmd')<cr>")
end

local function bufferline()
  local m = plugin_maps.bufferline
  map("n", m.next_buffer, ":BufferLineCycleNext <CR>")
  map("n", m.prev_buffer, ":BufferLineCyclePrev <CR>")
end

local function nvimtree()
  map("n", plugin_maps.nvimtree.toggle, ":NvimTreeToggle <CR>")
  map("n", plugin_maps.nvimtree.focus, ":NvimTreeFocus <CR>")
end

-- local function dashboard()
--   local m = plugin_maps.dashboard
--   map("n", m.bookmarks, ":DashboardJumpMarks <CR>")
--   map("n", m.new_file, ":DashboardNewFile <CR>")
--   map("n", m.open, ":Dashboard <CR>")
--   map("n", m.session_load, ":SessionLoad <CR>")
--   map("n", m.session_save, ":SessionSave <CR>")
-- end

local function telescope()
  local m = plugin_maps.telescope
  map("n", m.builtin, ":Telescope builtin <CR>")
  map("n", m.buffers, ":Telescope buffers <CR>")
  map("n", m.find_files, ":Telescope find_files <CR>")
  map("n", m.find_hiddenfiles, ":Telescope find_files hidden=true <CR>")
  map("n", m.help_tags, ":Telescope help_tags <CR>")
  map("n", m.live_grep, ":Telescope live_grep <CR>")
  map("n", m.oldfiles, ":Telescope oldfiles <CR>")
  map("n", m.search_char, ":Telescope current_buffer_fuzzy_find <CR>")
  map("n", m.commands, ":Telescope commands <CR>")
  map("n", m.comand_history, ":Telescope command_historys <CR>")
  map("n", m.registers, ":Telescope registers<CR>")
  map("n", m.keymaps, ":Telescope keymaps<CR>")
end

local formatter = function()
  local m = plugin_maps.formatter
  map("n", m.format, ":FormatWrite<CR>")
end

local git = function()
  map("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")
  map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>")
  map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>")
  map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>")
  map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>")
  map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>")
  map("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>")
  map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>")
  map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>")
  map("n", "<leader>go", "<cmd>Telescope git_status<cr>")
  map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
  map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
  map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>")
end

local hop = function()
  map(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
  )
  map(
    "n",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
  )
  map(
    "o",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
  )
  map(
    "o",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
  )
  map(
    "",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
  )
  map(
    "",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
  )
end

local toggle_term = function()
  local m = plugin_maps.term
  map("n",m.node,"<cmd>lua _NODE_TOGGLE()<cr>")
  map("n",m.ncdu,"<cmd>lua _NCDU_TOGGLE()<cr>")
  map("n",m.htop,"<cmd>lua _HTOP_TOGGLE()<cr>")
  map("n",m.lazygit,"<cmd>lua _LAZYGIT_TOGGLE()<cr>")
  map("n",m.python,"<cmd>lua _PYTHON_TOGGLE()<cr>")
  map("n",m.t_float,"<cmd>ToggleTerm direction=float<cr>")
  map("n",m.t_hori,"<cmd>ToggleTerm size=10 direction=horizontal<cr>")
  map("n",m.t_vert,"<cmd>ToggleTerm size=80 direction=vertical<cr>")

  function _G.set_terminal_keymaps()
    map("t", "<esc>", [[<C-\><C-n>]])
    map("t", "jk", [[<C-\><C-n>]])
    map("t", "<C-h>", [[<C-\><C-n><C-W>h]])
    map("t", "<C-j>", [[<C-\><C-n><C-W>j]])
    map("t", "<C-k>", [[<C-\><C-n><C-W>k]])
    map("t", "<C-l>", [[<C-\><C-n><C-W>l]])
  end
  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

M.lsp = function()
  local m = plugin_maps.lsp
  map("n", m.lspinfo, "<cmd>LspInfo<cr>")
  map("n", m.lspinstall_info, "<cmd>LspInstallInfo<cr>")
  map("n", m.codelens_action, "<cmd>lua vim.lsp.codelens.run()<cr>")
  map("n", m.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>")
  map("n", m.goto_definition, "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", m.hover_doc, "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", m.signaturehelp, "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("n", m.code_cation, "<cmd>CodeActionMenu<cr>")
  map("n", m.references, "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", m.show_line_diag, "<cmd>lua vim.diagnostic.open_float(nil,{focus=false,border='single',scope='cursor'})<cr>")
  map("n", m.show_docu_diag, "<cmd>Telescope lsp_document_diagnostics<cr>")
  map("n", m.show_work_diag, "<cmd>Telescope lsp_workspace_diagnostics<cr>")
  map("n", m.diag_jump_prev, "<cmd>lua vim.diagnostic.goto_prev({ border = 'single'})<cr>")
  map("n", m.diag_jump_next, "<cmd>lua vim.diagnostic.goto_prev({ border = 'single'})<cr>")
  map("n", m.list_line_diag, "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
end

M.init = function()
  non_config_mappings()
  optional_mappings()
  required_mappings()
  bufferline()
  nvimtree()
  telescope()
  formatter()
  hop()
  git()
  toggle_term()
end

return M
