local others = require("colors.onedark").others
local onedark = require("colors.onedark").dark

local present, bufferline = pcall(require, "bufferline")
if not present then
  return print("Bufferline not present!!!")
end

local colors ={
  black = onedark.black,
  bg = onedark.background,
  white = onedark.white,
  red = onedark.red,
  blue = onedark.blue,
  cyan = onedark.cyan,
  yellow = onedark.yellow,
  purple = onedark.purple,
  green = onedark.green,
  grey_fg2 = onedark.foregroun,
  fg = onedark.foregroun,
  teal = others.teal,
}

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
    numbers = function (opts)
      return string.format('%s',opts.id)
    end,
    indicator_icon = '|',
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    tab_size = 18,
    separator_style = "thin",
  },

  highlights = {
    close_button_selected = {
      guifg = colors.red,
      guibg = colors.black,
    },
    indicator_selected = {
      guifg = colors.blue,
      guibg = colors.black,
    },
    tab_selected = {
      guifg = colors.black,
      guibg = colors.teal,
    },
  },
}
