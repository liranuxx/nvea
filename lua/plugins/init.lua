local packer = require("plugins.init_packer")
local use = packer.use
local plug_ui = require("plugins.ui")
local plug_tools = require("plugins.tools")
local plug_editor = require("plugins.editor")
local plug_cmp = require("plugins.completion")

packer.startup(function()
  plug_ui.ui(use)
  plug_tools.tools(use)
  plug_editor.editor(use)
  plug_cmp.cmp(use)

end)
