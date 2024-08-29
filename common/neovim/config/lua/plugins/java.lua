return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java" } },
  },
  {
    "nvim-java/nvim-java",
    ft = "java",
    keys = {
      { "<leader>vr", "<cmd>JavaRunnerRunMain<cr>", desc = "Run Main Class" },
      { "<leader>vb", "<cmd>JavaBuildBuildWorkspace<cr>", desc = "Build the Workspace" },
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("java").setup()
      require("lspconfig").jdtls.setup({})
      require("which-key").add({
        { "<leader>v", desc = "+java" },
      })
    end,
  },
}
