local choices = {"vs", "Format"}
require "myplugin.cmenu.cmenu".open(
  choices,
  {
    callback = function(chosen)
      vim.cmd(choices[chosen])
      print("Final choice " .. choices[chosen])
    end
  }
)
