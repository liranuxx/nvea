local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
	return print("Lsp-installer not found!")
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
