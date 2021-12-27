local notification = require("myplugin.notification.notification")
return function (message,options)
  return notification(message,options)
end
