local colors = require("colors").get()
local present, bufferline = pcall(require, "bufferline")
if not present then
  return print("Bufferline not present!!!")
end

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
      guibg = colors.background,
    },
    indicator_selected = {
      guifg = colors.blue,
      guibg = colors.dackground,
    },
    tab_selected = {
      guifg = colors.black,
      guibg = colors.extra.teal,
    },
  },
}
