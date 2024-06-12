return {
  {
    "nvim-computercraft/lua-ls-cc-tweaked",
    lazy = true,
  },
  {
    "folke/lazydev.nvim",
    opts = {
      library = {
        {
          path = "lua-ls-cc-tweaked",
          words = {
            "turtle%.%w+",
            "rednet%.%w+",
            "redstone%.%w+",
            "computercraft",
          },
          mods = {
            "cc-tweaked",
          },
        },
      },
    },
  },
}
