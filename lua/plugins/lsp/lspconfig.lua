local present, nvim_lsp = pcall(require,"lspconfig")
if not present then
  return print("Lsp not present!!!")
end

-- beauty
require("plugins.lsp.handlers").setup()
local on_attach = require("plugins.lsp.handlers").on_attach
local capabilities = require("plugins.lsp.handlers").capabilities


-- 安装pyright
-- npm i -g pyright
-- 将sumneko_lua添加到环境变量中
-- /home/user/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/
-- 将clangd添加到环境变量中
-- /home/user/.local/share/nvim/lsp_servers/clangd/clangd_13.0.0/bin
-- 安装bash-language-serve
-- npm i -g bash-language-serve
local servers = { 'pyright', 'sumneko_lua', 'clangd', "bashls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    root_dir = function ()
      return vim.fn.getcwd()
    end
  }
end
