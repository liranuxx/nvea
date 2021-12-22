local present, lspconfig = pcall(require,"lspconfig")
if not present then
  return print("Lsp not present!!!")
end

vim.cmd [[packadd cmp-nvim-lsp]]

-- beauty
require("plugins.completion.config").lsp_handlers()

local function on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  require("core.mappings").lspconfig()
  require "lsp_signature".on_attach({
      bind = true,
      hint_enable = false,
      handler_opts = {
        border = "single"
      }
    }, bufnr)

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

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

local addlsp_confs = require("core.config").plugins.lspconfig.setup_lspconf

if #addlsp_confs ~= 0 then
  require(addlsp_confs).setup_lsp(on_attach, capabilities)
end
