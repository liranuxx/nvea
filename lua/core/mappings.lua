local cmd = vim.cmd
local utils = require("core.utils")
local map = utils.map
-- local map = vim.api.nvim_set_keymap
local basic = require("core.config").basic
local maps = require("core.config").mappings
local plugin_maps = maps.plugins


local M = {}

M.misc = function()
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
    map({"n","i"}, "<Esc>", "<Esc>:noh <CR>")

    -- yank from current cursor to end of line
    map("n", "Y", "yg$")

    map({"n","v"}, "H", "^")
    map({"n","v"}, "L", "$")
    map("n", "n", "nzz")
    map("n", "N", "Nzz")
    map("n", "*", "*zz")
    map("n", "#", "#zz")
    map("n", "g*", "g*zz")

    -- Visual
    map('v', 'J', ":m '>+1<cr>gv=gv")
    map('v', 'K', ":m '<-2<cr>gv=gv")
  end

  local function optional_mappings()

    -- don't yank text on cut ( x )
    if not basic.copy_cut then
      map({ "n", "v" }, "x", '"_x')
    end

    -- don't yank text on delete ( dd )
    if not basic.copy_del then
      map({ "n", "v" }, "d", '"_d')
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

      map("c", cnav.backward, "<Left>")
      map("c", cnav.forward, "<Right>")
      map("c", cnav.beginning_of_line, "<Home>")
      map("c", cnav.sudow, "w !sudo tee>/dev/null %")
    end

    -- easier navigation between windows
    if basic.window_nav then
      local wnav = maps.nv.window_nav

      map("n", wnav.moveLeft, "<C-w>h")
      map("n", wnav.moveRight, "<C-w>l")
      map("n", wnav.moveUp, "<C-w>k")
      map("n", wnav.moveDown, "<C-w>j")
    end

  end

  local function required_mappings()
    map("n", maps.close_buffer, ":lua require('core.utils').close_buffer() <CR>") -- close  buffer
    map("n", maps.copy_whole_file, ":%y+ <CR>") -- copy whole file content
    map("n", maps.new_buffer, ":enew <CR>") -- new buffer
    map("n", maps.new_tab, ":tabnew <CR>") -- new tabs
    map("n", maps.line_number_toggle, ":set nu! <CR>") -- toggle numbers
    map("n", maps.save_file, ":w <CR>") -- ctrl + s to save file
    map("n", maps.quit_file, ":q! <CR>") -- ctrl + s to save file
    map("n", maps.save_quit_file, ":wq! <CR>") -- ctrl + s to save file

    -- Add Packer commands because we are not loading it at startup
    -- cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
    -- cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
    -- cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
    -- cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
    -- cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
    -- cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
  end
  non_config_mappings()
  optional_mappings()
  required_mappings()
end

M.bufferline = function()
  local m = plugin_maps.bufferline

  map("n", m.next_buffer, ":BufferLineCycleNext <CR>")
  map("n", m.prev_buffer, ":BufferLineCyclePrev <CR>")
end
--
M.nvimtree = function()
  map("n", plugin_maps.nvimtree.toggle, ":NvimTreeToggle <CR>")
  map("n", plugin_maps.nvimtree.focus, ":NvimTreeFocus <CR>")
end
--
M.dashboard = function()
  local m = plugin_maps.dashboard

  map("n", m.bookmarks, ":DashboardJumpMarks <CR>")
  map("n", m.new_file, ":DashboardNewFile <CR>")
  map("n", m.open, ":Dashboard <CR>")
  map("n", m.session_load, ":SessionLoad <CR>")
  map("n", m.session_save, ":SessionSave <CR>")
end

M.telescope = function()
  local m = plugin_maps.telescope

  map("n", m.buffers, ":Telescope buffers <CR>")
  map("n", m.find_files, ":Telescope find_files <CR>")
  map("n", m.find_hiddenfiles, ":Telescope find_files hidden=true <CR>")
  map("n", m.git_commits, ":Telescope git_commits <CR>")
  map("n", m.git_status, ":Telescope git_status <CR>")
  map("n", m.help_tags, ":Telescope help_tags <CR>")
  map("n", m.live_grep, ":Telescope live_grep <CR>")
  map("n", m.oldfiles, ":Telescope oldfiles <CR>")
  map("n", m.themes, ":Telescope themes <CR>")
end

M.lspsaga = function()
  local m = plugin_maps.lspsaga
  
  map("n", m.rename, "<cmd>Lspsaga rename<cr>")
  map("n", m.code_cation, "<cmd>Lspsaga code_action<cr>")
  map("x", m.code_cation, ":<c-u>Lspsaga range_code_action<cr>")
  map("n", m.hover_doc, ":Lspsaga hover_doc<cr>")
  map("n", m.lsp_finder, ":Lspsaga lsp_finder<cr>")
  map("n", m.signaturehelp, ":Lspsaga signaturehelp<cr>")
  map("n", m.show_line_diag, "<cmd>Lspsaga show_line_diagnostics<cr>")
  map("n", m.preview_def, "<cmd>Lspsaga preview_definition<cr>")
  map("n", m.open_terminal, ":Lspsaga open_floaterm<CR>")
  map("t", m.close_terminal, "<C-\\><C-n>:Lspsaga close_floaterm<CR>")
  map("n", m.diag_jump_next, "<cmd>Lspsaga diagnostic_jump_next<cr>")
  map("n", m.diag_jump_prev, "<cmd>Lspsaga diagnostic_jump_prev<cr>")
  map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
  map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
end

return M
