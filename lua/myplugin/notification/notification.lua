
-- vim.cmd("hi NotificationInfo guifg="#80ff95")
-- vim.cmd("hi NotificationWarning guifg="#fff454")
-- vim.cmd("hi NotificationError guifg="#c44323")
local notification = {}

local function tbl_longest_str(tbl)
  local len = 0

  for _,str in pairs(tbl) do
    len = math.max(len, #str)
  end

  return len
end

function notification.notification(message, options)
  if type(message) == "string" then
    message = {message}
  end

  options = options or {}
  options.delay = options.delay or 2000
  options.style = options.style or "info"
  options.border = options.border or "single"

  local win_current_width = vim.api.nvim_get_option("columns")
  local win_current_height = vim.api.nvim_get_option("lines")

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, message)

  local window = vim.api.nvim_open_win(buf, false,
  {
    relative = "win",
    row = options.row or -1,
    col = options.col or win_current_width -1 ,
    width = tbl_longest_str(message),
    height = #message,
    style = "minimal",
    border = options.border,
  })

  if options.style == "info" then
    vim.api.nvim_win_set_option(window, "winhl", "Normal:NotificationInfo")
  elseif options.style == "warning" then
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

  timer = vim.defer_fn(delete, options.delay)

  return {
    window = window,
    height = options.height,
    width = options.width,
    row = options.row,
    col = options.col,
    content = message,
    border = options.border,
    delete = delete
  }
end

setmetatable(notification, {
  __call = function(_, m, o)
    if vim.in_fast_event() then
      vim.schedule(function()
        notification.notification(m, o)
      end)
    else
      notification.notification(m, o)
    end
  end,
})

return notification
