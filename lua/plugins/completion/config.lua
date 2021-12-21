local M = {}

M.luasnip = function()
  local present, luasnip = pcall(require, "luasnip")
  if not present then
    return print("Luasnip not present")
  end

  luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI"
  }

  -- require("luasnip/loaders/from_vscode").load { paths = config.plugins.options.luasnip.snippet_path }
  require("luasnip/loaders/from_vscode").load()
end

M.formatter = function()
  local present, formatter = pcall(require, "formatter")
  if not present then
    return print("Formatter not present!!!")
  end
  formatter.setup(
    {
      filetype = {
        lua = {
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        },
        sh = {
          function()
            return {
              exe = "shfmt",
              args = {"-i", 2},
              stdin = true
            }
          end
        },
        cpp = {
          function()
            return {
              exe = "clang-format",
              args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        },
        python = {
          function()
            return {
              exe = "python3 -m autopep8",
              args = {
                "--in-place --aggressive --aggressive",
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
              },
              stdin = false
            }
          end
        }
      }
    }
  )
end

M.lspinstaller = function()
  local present, lspinstaller = pcall(require, "nvim-lsp-installer")
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

M.lsp_handlers = function()
  -- Highlight line number instead of having icons in sign column
  vim.cmd [[
    highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
    highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
    highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
    highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
  ]]
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = ">"
    }
  )

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(
    vim.lsp.handlers.hover,
    {
      border = "single"
    }
  )
  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
      border = "single"
    }
  )
end

return M
