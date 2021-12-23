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
