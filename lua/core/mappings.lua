local utils = require("core.utils")
local map = utils.map
-- local map = vim.api.nvim_set_keymap
local basic = require("core.config").basic
local maps = require("core.config").mappings
local plugin_maps = maps.plugins

local M = {}

local function non_config_mappings()
  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  -- empty mode is same as using :map
  -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
  map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
  map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})
  map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
  map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})

  -- use ESC to turn off search highlighting
  map({"n", "i"}, "<Esc>", "<Esc>:noh <CR>")

  -- yank from current cursor to end of line
  map("n", "Y", "yg$")

  map({"n", "v"}, "H", "^")
  map({"n", "v"}, "L", "$")
  map("n", "n", "nzz")
  map("n", "N", "Nzz")
  map("n", "*", "*zz")
  map("n", "#", "#zz")
  map("n", "g*", "g*zz")

  -- Visual
  map("v", "J", ":m '>+1<cr>gv=gv")
  map("v", "K", ":m '<-2<cr>gv=gv")
end

local function optional_mappings()
  -- don't yank text on cut ( x )
  if not basic.copy_cut then
    map({"n", "v"}, "x", '"_x')
  end

  -- don't yank text on delete ( dd )
  if not basic.copy_del then
    map({"n", "v"}, "d", '"_d')
  end

  -- navigation within insert mode
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
  if basic.cmd_nav then
    local cnav = maps.nv.cmd_nav
    map("c",cnav.backward,"<Left>")
    -- map("c",cnav.forward,"<Right>")
    -- map("c",cnav.beginning_of_line,"<Home>")
    map("c",cnav.endding_of_line,"<End>")
    map("c",cnav.sudow,"w !sudo tee>/dev/null %")
  end

  -- easier navigation between windows
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
  map("n", maps.save_file, ":w <CR>") -- ctrl + s to save file
  map("n", maps.quit_file, ":q! <CR>") -- ctrl + s to save file
  -- map("n", maps.save_quit_file, ":wq! <CR>") -- ctrl + s to save file

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
--
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
  map("n", m.git_commits, ":Telescope git_commits <CR>")
  map("n", m.git_status, ":Telescope git_status <CR>")
  map("n", m.help_tags, ":Telescope help_tags <CR>")
  map("n", m.live_grep, ":Telescope live_grep <CR>")
  map("n", m.oldfiles, ":Telescope oldfiles <CR>")
  map("n", m.search_char, ":Telescope current_buffer_fuzzy_find <CR>")
  map("n", "<leader>fp", ":Telescope project<CR>")
  map("n", m.themes, ":Telescope themes <CR>")
end

-- local function lspsaga()
--
--   map("n", m.rename, "<cmd>Lspsaga rename<cr>")
--   map("x", m.code_cation, ":<c-u>Lspsaga range_code_action<cr>")
--   map("n", m.hover_doc, ":Lspsaga hover_doc<cr>")
--   map("n", m.lsp_finder, ":Lspsaga lsp_finder<cr>")
--   map("n", m.signaturehelp, ":Lspsaga signaturehelp<cr>")
--   map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
--   map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
-- end

M.init = function ()
  non_config_mappings()
  optional_mappings()
  required_mappings()
  bufferline()
  nvimtree()
  telescope()
end

M.on_attach = function (_, bufnr)
  print()
  local function buf_set_keymap(...)
     vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
     vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  local m = plugin_maps.lspsaga

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", m.goto_definition, "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", m.preview_def, "<cmd>Lspsaga preview_definition<cr>", opts)
  buf_set_keymap("n", m.hover_doc, "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", m.code_cation, "<cmd>Lspsaga code_action<cr>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- buf_set_keymap("n", m.show_line_diag, "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  buf_set_keymap("n", m.diag_jump_next, "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  buf_set_keymap("n", m.diag_jump_prev, "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  buf_set_keymap("n", m.list_line_diag, "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", m.open_terminal, ":Lspsaga open_floaterm<CR>", opts)
  buf_set_keymap("t", m.close_terminal, "<C-\\><C-n>:Lspsaga close_floaterm<CR>", opts)
end

return M
