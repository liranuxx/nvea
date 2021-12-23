local present, lsp = pcall(require,"lspconfig")
if not present then
  return print("Lsp not present!!!")
end

-- beauty
require("plugins.lsp.handlers").setup()
local on_attach = require("plugins.lsp.handlers").on_attach
local capabilities = require("plugins.lsp.handlers").capabilities

local lua = require("plugins.lsp.langs.lua")
lua(lsp,on_attach,capabilities)
