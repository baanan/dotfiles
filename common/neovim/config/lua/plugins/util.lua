return {
  {
    "folke/which-key.nvim",
    init = function()
      -- register group names
      require("which-key").register({
        a = { name = "arguments", m = { name = "move" } },
      }, { prefix = "<leader>" })
    end,
  },
}
