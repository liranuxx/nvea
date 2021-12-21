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
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ""
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
    end
    return str
  end
end

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
  [""] = c.orange,
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
      return " "
    end,
    fmt = trunc(80, 4, nil, true),
    color = "LualineMode",
    padding = {left = 1, right = 0}
  },
  {
    "mode",
    color = "LualineMode",
    padding = {left = 0, right = 0}
  }
}
local lualine_b = {
  {
    'filetype',
    colored = true, -- displays filetype icon in color if set to `true
    icon_only = true, -- Display only icon for filetype
  },
  {
    "filename",
    fmt = trunc(90, 30, 50),
    color = {fg = c.white, gui = "bold"},
    padding = {left = 0, right = 0}
  },
  {
    "filesize",
    color = {fg = c.cyan},
    cond = conditions.buffer_not_empty
  }
}
local lualine_c = {
  {
    "diff",
    symbols = {added = "+", modified = "~", removed = "-"},
    diff_color = {
      added = {fg = c.green},
      modified = {fg = c.orange},
      removed = {fg = c.red}
    },
    cond = conditions.hide_in_width
  },
  {
    "diagnostics",
    sources = {"nvim_diagnostic"},
    symbols = {error = " ", warn = " ", info = " "},
    diagnostics_color = {
      error = {fg = c.red},
      warn = {fg = c.yellow},
      info = {fg = c.blue},
      hit = {fg = c.green}
    }
  },
  {
    "os.date('%a')",
    color = {fg=c.dark_red}
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
    fmt = conditions.hide_in_width
  },
}

local lualine_x = {
  -- {
  --   function()
  --     return vim.api.nvim_win_get_number(0)
  --   end
  -- },
  {
    "lsp_progress",
    display_components = {"lsp_client_name", "spinner", {"percentage"}},
    colors = {
      percentage = c.cyan,
      title = c.cyan,
      message = c.cyan,
      spinner = c.cyan,
      lsp_client_name = c.magenta,
      use = true
    },
    spinner_symbols = {"🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 "}
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
          return client.name
        end
      end
      return msg
    end,
    icon = " ",
    color = {fg = c.comment_grey, gui = "bold"}
  }
}
local lualine_y = {
  {
    "b:gitsigns_head",
    icon = "",
    color = {fg = c.green, gui = "bold"},
    padding = {right = 0}
  },
  {
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = {fg = c.cyan, gui = "bold"},
    padding = {left = 1, right = 0}
  },
  {
    "fileformat",
    fmt = string.upper,
    icons_enabled = false,
    color = {fg = c.yellow, gui = "bold"},
    padding = {left = 1, right = 0}
  }
}
local lualine_z = {
  {
    "location",
    color = {fg = c.blue}
  },
  {
    function()
      return ""
    end,
    color = "LualineMode",
    padding = {right = 0}
  },
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
    padding = {left = 1, right = 0}
  },
  {
    function()
      return "▊"
    end,
    color = {fg = c.blue},
    padding = {left = 0}
  }
}

lualine.setup {
  options = {
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
    theme = {
      normal = {c = {fg = c.foreground, bg = c.background}},
      inactive = {c = {fg = c.foreground, bg = c.background}}
    }
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
