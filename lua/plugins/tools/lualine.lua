local present, lualine = pcall(require, "lualine")
local c = require("colorschemes").get()
if not present then
  return print("Lualine not present!!!")
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 100
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

local mode_color = {
  n = c.red,
  i = c.green,
  v = c.blue,
  [""] = c.blue,
  V = c.blue,
  c = c.magenta,
  no = c.red,
  s = c.orange,
  S = c.orange,
  ic = c.yellow,
  R = c.violet,
  Rv = c.violet,
  cv = c.red,
  ce = c.red,
  r = c.cyan,
  rm = c.cyan,
  ["r?"] = c.cyan,
  ["!"] = c.red,
  t = c.red
}

local lualine_a = {
  {
    function()
      vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. c.background)
      return ""
    end,
    color = "LualineMode",
    padding = {left=1,right=0}
  },
  {
    "mode",
    color = "LualineMode",
  },
  {
    "os.date('%a %H:%M')",
    color = {fg=c.blue},
    padding = {left=0,right=1}
  },
}
local lualine_b = {
  {
    "b:gitsigns_head",
    icon = "",
    color = {fg = c.green, gui = "bold"},
    cond = conditions.hide_in_width,
  },
  {
    "diff",
    symbols = {added = "+", modified = "~", removed = "-"},
    diff_color = {
      added = {fg = c.green},
      modified = {fg = c.orange},
      removed = {fg = c.red}
    },
    cond = conditions.hide_in_width,
    padding = {left=0,right=1}
  },
  {
    function()
      if vim.v.hlsearch == 0 then
        return ""
      end
      local last_search = vim.fn.getreg "/"
      if not last_search or last_search == "" then
        return ""
      end
      local searchcount = vim.fn.searchcount {maxcount = 9999}
      return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
    end,
    color = {fg = c.black, bg = c.dark_yellow},
    cond = conditions.hide_in_width
  },
}
local lualine_c = {
  { "%=" },
  {
    "filename",
    color = {fg = c.black, bg = c.blue, gui = "bold"},
  },
  {
    function()
      local msg = "Hello"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return msg
        end
      end
      return msg
    end,
    icon = " ",
    color = {fg = c.comment_grey, gui = "bold"},
    cond = conditions.hide_in_width
  }
}

local lualine_x = {
  {
    "location",
    color = {fg = c.extra.pink},
    padding = {left=1,right=0},
  },
  {
    "filesize",
    color = {fg = c.yellow},
    cond = conditions.buffer_not_empty and conditions.hide_in_width,
  },
}
local lualine_y = {
  {
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = {fg = c.cyan, gui = "bold"},
    padding = {left=1,right=0}
  },
}
local lualine_z = {
  {
    function()
      local current_line = vim.fn.line "."
      local total_line = vim.fn.line "$"

      if current_line == 1 then
        return "Top "
      elseif current_line == vim.fn.line "$" then
        return "Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return result .. "%% "
    end,
    color = "LualineMode",
    padding = {left=1,right=0}
  },
  {
    function()
      return "▊"
    end,
    color = "LualineMode",
    padding = {right=0}
  },
}

lualine.setup {
  options = {
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
    theme = {
      normal = {
        a = {fg = c.foreground, bg = c.background},
        b = {fg = c.foreground, bg = c.background},
        c = {fg = c.foreground, bg = c.background},
      },
    },
  },
  sections = {
    lualine_a = lualine_a,
    lualine_b = lualine_b,
    lualine_c = lualine_c,
    lualine_x = lualine_x,
    lualine_y = lualine_y,
    lualine_z = lualine_z
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  },
}
