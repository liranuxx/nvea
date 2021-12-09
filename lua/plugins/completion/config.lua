local M = {}

M.luasnip = function()
  local present, luasnip = pcall(require,"luasnip")
  if not present then
    return print("Luasnip not present")
  end

  luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }

   -- require("luasnip/loaders/from_vscode").load { paths = config.plugins.options.luasnip.snippet_path }
  require("luasnip/loaders/from_vscode").load()
end

M.formatter = function()
local present, formatter = pcall(require, "formatter")
if not present then
  return print("Formatter not present!!!")
end
formatter.setup({
  filetype = {
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
  }
})
end

M.lspinstaller = function()
  local present, lspinstaller = pcall(require,"nvim-lsp-installer")
  if not present then
    return print("Lspinstaller not present!!!")
  end
  lspinstaller.settings {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  }
end

M.lspsaga = function()
  local present, lspsaga = pcall(require,"lspsaga")
  if not present then
    return print("Lspsaga not present!!!")
  end
  lspsaga.setup {
    use_saga_diagnostic_sign = false,
    code_action_icon = " ",
  }
end

return M
