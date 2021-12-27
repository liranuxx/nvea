require("notify.config.highlights")

local default_config = {
  timeout = 5000,
  stages = "fade_in_slide_out",
  render = "minimal",
  background_colour = "Normal",
  on_open = nil,
  on_close = nil,
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
}

return default_config
