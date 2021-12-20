local colors = require("colors").get()
local global = require("core.global")
local center_string = require("core.config").plugins.feline.center_string
local lsp = require "feline.providers.lsp"
local present, feline = pcall(require, "feline")
if not present then
  return print("Feline not present!!!")
end

local vi_mode_utils = require("feline.providers.vi_mode")

local vi_mode_colors = {
  NORMAL = colors.red,
  INSERT = colors.purple,
  TERM = colors.green,
  VISUAL = colors.blue,
  BLOCK = colors.cyan,
  REPLACE = colors.dark_yellow,
  ["V-REPLACE"] = colors.dark_yellow,
  SELECT = colors.cyan,
  ENTER = colors.cyan,
  COMMAND = colors.yellow,
  PROMPT = colors.yellow,
  MORE = colors.yellow,
  SHELL = colors.green,
  OP = colors.green,
  NONE = colors.yellow,
}


local function file_osinfo()
  local os
  local icon
  if global.is_linux then
    os = 'UNIX'
    icon = '  '
  elseif global.is_win then
    os = 'WIN'
    icon = '  '
  else
    os = 'MAC'
    icon = '  '
  end
  return icon .. os
end

local icon_styles = {
  arrow = {
    left = "",
    right = "",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },

  default = {
    left = " ",
    right = " ",
    main_icon = "  ",
    system_icon = file_osinfo(),
    position_icon = "  ",
  },
}

-- local config = require("core.default_config").plugins.options.statusline
-- statusline style
local user_statusline_style = "default"
local statusline_style = icon_styles[user_statusline_style]
-- if show short statusline on small screens

local shortline = false

-- Initialize the components table
local components = {
  active = {},
  inactive = {},
}

-- Initialize left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

local mode_hl = function()
  return {
    fg = vi_mode_utils.get_mode_color(),
    -- bg = colors.statusline_bg,
  }
end

components.active[1][1] = {
  provider = function()
    return statusline_style.main_icon .. vi_mode_utils.get_vim_mode()
  end,
  right_sep = statusline_style.right,
  hl = mode_hl,
}

components.active[1][2] = {
  provider = 'file_info',
  file_modified_icon = '',
  -- icon = " "
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 70
  end,
  hl = {
    fg = colors.white,
  },
}

components.active[1][3] = {
  provider = 'file_size',
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 100
  end,
  -- right_sep = statusline_style.right,
  hl = {
    fg = colors.cyan,
  },
}

components.active[1][4] = {
  provider = "git_diff_added",
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 110
  end,
  left_sep = statusline_style.left,
  hl = {
    fg = colors.red,
  },
  icon = "  ",
}
-- diffModfified
components.active[1][5] = {
  provider = "git_diff_changed",
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 110
  end,
  hl = {
    fg = colors.yellow,
  },
  icon = "  ",
}
-- diffRemove
components.active[1][6] = {
  provider = "git_diff_removed",
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 110
  end,
  hl = {
    fg = colors.blue,
  },
  icon = "  ",
}

components.active[1][7] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist "Error"
  end,
  hl = { fg = colors.red },
  icon = "  ",
}

components.active[1][8] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist "Warning"
  end,
  hl = { fg = colors.yellow },
  icon = "  ",
}

components.active[1][9] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist "Hint"
  end,
  hl = { fg = colors.grey_fg2 },
  icon = "  ",
}

components.active[1][10] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist "Information"
  end,
  hl = { fg = colors.green },
  icon = "  ",
}
components.active[2][1] = {
  provider = function()
    return center_string
  end,
  -- enabled = shortline or function(winid)
  --    return vim.api.nvim_win_get_width(winid) > 80
  -- end,
  hl = { fg = colors.green },
}

components.active[3][1] = {
  provider = 'lsp_client_names',
  right_sep = statusline_style.right,
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 90
  end,
  hl = { fg = colors.grey_fg2 },
}

components.active[3][2] = {
  provider = "git_branch",
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 110
  end,
  left_sep = statusline_style.left,
  right_sep = statusline_style.right,
  hl = {
    -- fg = "#a9a1e1",
    fg = colors.green,
  },
  -- icon = "  ",
}

components.active[3][3] = {
  provider = "file_encoding",
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 100
  end,
  left_sep = statusline_style.left,
  hl = {
    -- fg = "#a9a1e1",
    fg = colors.cyan,
  },
}

components.active[3][4] = {
  provider = statusline_style.system_icon,
  enabled = shortline or function(winid)
    return vim.api.nvim_win_get_width(winid) > 120
  end,
  left_sep = statusline_style.left,
  hl = function()
    return {
      fg = vi_mode_utils.get_mode_color(),
    }
  end,
}

components.active[3][5] = {
  provider = statusline_style.position_icon,
  left_sep = statusline_style.left,
  hl = {
    fg = colors.green,
  },
}

components.active[3][6] = {
  provider = function()
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

  hl = {
    fg = colors.green,
  },
}

feline.setup {
  colors = {
    bg = colors.background,
    fg = colors.fg,
  },
  vi_mode_colors = vi_mode_colors,
  components = components,
}
