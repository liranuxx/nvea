-- 安装bash-language-serve
-- npm i -g bash-language-serve
return function(lsp,on_attach,capabilities)
  lsp.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function ()
      return vim.fn.getcwd()
    end
  }
end
