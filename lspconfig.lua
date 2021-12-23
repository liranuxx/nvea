local present, lsp = pcall(require,"lspconfig")
if not present then
  return print("Lsp not present!!!")
end
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return print("Lsp-installer not present!!!")
end

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}


-- beauty
require("plugins.lsp.handlers").setup()

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("plugins.lsp.langs.lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("plugins.lsp.langs.python")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
