-- 安装pyright
-- npm i -g pyright
return function(lsp,on_attach,capabilities)
  lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function ()
      return vim.fn.getcwd()
    end
  }
end
