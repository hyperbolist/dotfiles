require'lspconfig'.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
    },
  },
  on_attach=require'lsp_signature'.on_attach
}
