-- 将sumneko_lua添加到环境变量中
-- /home/liran/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/
return function(lsp,on_attach,capabilities)
  lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function ()
      return vim.fn.getcwd()
    end
  }
end
