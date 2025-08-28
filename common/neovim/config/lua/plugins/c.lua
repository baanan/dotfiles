return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = {
        exclude = {
            "clangd"
        }
      }
    },
  }
}
