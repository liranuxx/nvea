local function tbl_longest_str(tbl)
  local len = 0
  for _,str in pairs(tbl) do
    len = math.max(len, #str)
  end
  return len
end

local function get_position(pos)
  local floor = math.floor
  local win_current_width = vim.api.nvim_get_option("columns")
  local win_current_height = vim.api.nvim_get_option("lines")
  local position = {
    top = {
      col = win_current_width-1,
      row = 0,
    },
    mid = {
      col = win_current_width-1,
      row = floor(win_current_height/2)-5,
    },
    bot = {
      col = win_current_width-1,
      row = win_current_height-7,
    },
  }
  return position[pos]
end

-- opts = {
--   relative,
--   anchor,
--   width,
--   height,
--   col,
--   row,
--   border,
-- }
local function float_win(opts)
  local position ={
    topleft = "NW",
    topright = "NE",
    botleft = "SW",
    botright = "SE",
  }
  local anchor = position[opts.anchor]
  local relative = opts.relative
  local width = opts.width
  local height = opts.height
  local col, row = opts.col, opts.row
  local style = opts.style
  local border = opts.border

  local win_opts = {
    relative = relative,
    anchor = anchor,
    width =  width,
    height = height,
    col = col,
    row = row,
    style =  style,
    border = border,
  }
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, false, win_opts)
  return buf, win
end

return function(message, opts, style)
  if type(message) == "string" then
    message = {message}
  end

  opts = opts or {}
  local delay = opts.delay or 3000
  local position = opts.position or "top"

  local options = {
    relative = opts.relative or "win",
    anchor = opts.anchor or "topleft",
    width = tbl_longest_str(message),
    height = #message,
    col = get_position(position).col,
    row = get_position(position).row,
    border = opts.border or "single",
  }
  local buf, window = float_win(options)

  vim.api.nvim_buf_set_option(buf, "filetype", "notification")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, message)

  style = style or "info"
  if style == "info" then
    vim.api.nvim_win_set_option(window, "winhl", "Normal:NotificationInfo")
  elseif style == "warning" then
    vim.api.nvim_win_set_option(window, "winhl", "Normal:NotificationWarning")
  else
    vim.api.nvim_win_set_option(window, "winhl", "Normal:NotificationError")
  end

  local timer
  local delete = function()
    if timer:is_active() then
      timer:stop()
    end
    if vim.api.nvim_win_is_valid(window) then
      vim.api.nvim_win_close(window, false)
    end
  end
  timer = vim.defer_fn(delete, delay)
end
