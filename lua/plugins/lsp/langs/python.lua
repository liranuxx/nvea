return function(lsp,on_attach,capabilities)
  lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
