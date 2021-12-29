local choices = {"vs", "Format", "sp"}
require "myplugin.cmenu.cmenu".open(
  choices,
  {
    callback = function(chosen)
      vim.cmd(choices[chosen])
      print("Final choice " .. choices[chosen])
    end
  }
)
