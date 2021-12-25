-- 将clangd添加到环境变量中
-- /home/liran/.local/share/nvim/lsp_servers/clangd/clangd_13.0.0/bin
return function(lsp,on_attach,capabilities)
  lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function ()
      return vim.fn.getcwd()
    end
  }
end
