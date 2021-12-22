local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = { 'bashls', 'pyright', }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      root_dir = function ()
        return vim.fn.getcwd()
      end
    }
  end

  -- lua
  local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
  local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  lspconfig.sumneko_lua.setup {
    on_attach = attach,
    capabilities = capabilities,
    cmd = {
      sumneko_binary, "-E",
      sumneko_root_path .. "/main.lua", "--locale=zh-cn"
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
    root_dir = function ()
      return vim.fn.getcwd()
    end
  }

  -- c/c++
  local clangd_root_path = vim.fn.stdpath('data') .. "/lsp_servers/clangd"
  local clangd_binary = clangd_root_path .. "/clangd_13.0.0/bin/clangd"
  lspconfig.clangd.setup {
    on_attach = attach,
    capabilities = capabilities,
    cmd = {
      clangd_binary,
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
    root_dir = function ()
      return vim.fn.getcwd()
    end
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
end

return M
