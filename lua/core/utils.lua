local M = {}

M.toggle_colors = function()
end

-- hide statusline
-- tables fetched from load_config function
M.hide_statusline = function()
   local hidden = {
            "help",
            "dashboard",
            "NvimTree",
            "terminal",
         }
   local shown = {}
   local api = vim.api
   local buftype = api.nvim_buf_get_option("%", "ft")

   -- shown table from config has the highest priority
   if vim.tbl_contains(shown, buftype) then
      api.nvim_set_option("laststatus", 2)
      return
   end

   if vim.tbl_contains(hidden, buftype) then
      api.nvim_set_option("laststatus", 0)
      return
   else
      api.nvim_set_option("laststatus", 2)
   end
end

M.map = function(mode, keys, cmd, opt)
   -- get the extra options
   local options = { noremap = true, silent = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   -- all valid modes allowed for mappings
   -- :h map-modes
   local valid_modes = {
      [""] = true,
      ["n"] = true,
      ["v"] = true,
      ["s"] = true,
      ["x"] = true,
      ["o"] = true,
      ["!"] = true,
      ["i"] = true,
      ["l"] = true,
      ["c"] = true,
      ["t"] = true,
   }

   -- helper function for M.map
   -- can gives multiple modes and keys
   local function map_wrapper(mod, lhs, rhs, opts)
      if type(lhs) == "table" then
         for _, key in ipairs(lhs) do
            map_wrapper(mod, key, rhs, opts)
         end
      else
         if type(mod) == "table" then
            for _, m in ipairs(mode) do
               map_wrapper(m, lhs, rhs, opts)
            end
         else
            if valid_modes[mod] and lhs and rhs then
               vim.api.nvim_set_keymap(mod, lhs, rhs, opts)
            else
               mod, lhs, rhs = mod or "", lhs or "", rhs or ""
               print("Cannot set mapping [ mode = '" .. mod .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
            end
         end
      end
   end

   map_wrapper(mode, keys, cmd, options)
end

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
   vim.cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   vim.cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M

