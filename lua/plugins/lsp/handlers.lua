local M = {}
M.setup = function()
  -- Highlight line number instead of having icons in sign column
  vim.cmd [[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
  ]]
  if vim.fn.has "nvim-0.6" == 1 then
    vim.diagnostic.config(
      {
        signs = {
          active = false,
          values = {
            {name = "DiagnosticSignError", text = ""},
            {name = "DiagnosticSignWarn", text = ""},
            {name = "DiagnosticSignHint", text = ""},
            {name = "DiagnosticSignInfo", text = ""}
          }
        },
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
          format = function(d)
            local t = vim.deepcopy(d)
            if d.code then
              t.message = string.format("%s [%s]", t.message, t.code):gsub("1. ", "")
            end
            return t.message
          end
        }
      }
    )
  else
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        virtual_text = {
          prefix = ">"
        }
      }
    )
  end
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

M.on_attach = function (client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- mappings
  require("core.mappings").lsp()
  if client.resolved_capabilities.document_highlight then
    -- hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    -- hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    -- hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    vim.cmd [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]]
  end
end

vim.cmd [[packadd cmp-nvim-lsp]]
M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

return M
