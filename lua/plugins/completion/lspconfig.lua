local present, lspconfig = pcall(require,"lspconfig")
local global = require("core.global")
if not present then
  return print("Lsp not present!!!")
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

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      source = "always",
      prefix = '>',
    }
})

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


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'bashls', 'pyright', }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern('../../')
  }
end


-- lua
local system_name
if global.is_mac then
  system_name = "macOS"
elseif global.is_linux then
  system_name = "Linux"
elseif global.is_win then
  system_name = "Windows"
else
  return print("Unsupported system for sumneko")
end
local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  cmd = {
    sumneko_binary,
    "-E",
    sumneko_root_path .. "/main.lua",
    "--locale=zh-cn"
  };
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim','packer_plugins'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
  root_dir = lspconfig.util.root_pattern('../../')
}

-- c/c++
local clangd_root_path = vim.fn.stdpath('data') .. "/lsp_servers/clangd"
local clangd_binary = clangd_root_path .. "/clangd_13.0.0/bin/clangd"
lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    clangd_binary,
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
  root_dir = lspconfig.util.root_pattern('../../')
}

-- bash
-- local bash_root_path = vim.fn.stdpath('data') .. "/lsp_servers/bash/"
-- local bash_binary = bash_root_path .. "/node_modules/.bin/bash-language-server"
-- lspconfig.bashls.setup {
--   cmd = { bash_binary, "start" },
--   cmd_env = {
--     GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
--   },
--   filetypes = { "sh" },
--   single_file_support = true,
-- }
