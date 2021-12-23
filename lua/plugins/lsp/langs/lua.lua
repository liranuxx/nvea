local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return function(lsp,on_attach,capabilities)
  lsp.sumneko_lua.setup {
    on_attach = on_attach,
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
end
