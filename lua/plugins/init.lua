local packer = require("plugins.init_packer")
local ui = require("plugins.ui")
local editor = require("plugins.editor")
local tools = require("plugins.tools")
local completion = require("plugins.completion")
local lspconfig = require("plugins.lsp")

local use = packer.use

packer.startup(function()
  use {"wbthomason/packer.nvim", opt = true}
  use {"nvim-lua/plenary.nvim"}

  ui(use)
  tools(use)
  editor(use)
  completion(use)
  lspconfig(use)

  use {'nvim-lua/popup.nvim'}
end)
