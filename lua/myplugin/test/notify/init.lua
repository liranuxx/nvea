local config = require("myplugin.test.notify.config")
local stages = require("myplugin.test.notify.stages")
local Notification = require("notify.service.notification")
local service
local notify = {}

function notify.setup()
  local animator_stages = config.stages()
end

function notify.notify(message, level, opts)
  if not service then
    notify.setup()
  end
  opts = opts or {}
  opts.render = require("myplugin.test.notify.render.minimal")
  local notification = Notification(message, level, opts)
  service:push(notification)

end

setmetatable(notify, {
  __call = function(_, m, l)
    if vim.in_fast_event() then
      vim.schedule(function()
        notify.notify(m, l)
      end)
    else
      notify.notify(m, l)
    end
  end,
})

return notify
