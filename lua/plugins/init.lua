local packer = require("plugins.init_packer")

local status_ui, plug_ui = pcall(require, "plugins.ui")
if not status_ui then
  return print("Error loading plugin_ui\n\n"..plug_ui)
end

local status_tools, plug_tools = pcall(require, "plugins.tools")
if not status_tools then
  return print("Error loading plugin_tools\n\n"..plug_tools)
end

local status_editor, plug_editor = pcall(require, "plugins.editor")
if not status_editor then
  return print("Error loading plugin_editor\n\n"..plug_editor)
end

local status_cmp, plug_cmp = pcall(require, "plugins.completion")
if not status_cmp then
  return print("Error loading plugin_cmp\n\n"..plug_cmp)
end

local use = packer.use

packer.startup(function()
  plug_ui.ui(use)
  plug_tools.tools(use)
  plug_editor.editor(use)
  plug_cmp.cmp(use)
end)
