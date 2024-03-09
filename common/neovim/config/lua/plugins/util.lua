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
  {
    "tpope/vim-repeat",
  },
  {
    "folke/persistence.nvim",
    opts = {
      pre_save = function()
        if require("lazyvim.util").has("easymotion/vim-easymotion") then
          -- if "loaded" persists it fails to load when a session is loaded
          vim.cmd([[unlet EasyMotion_loaded]])
        end
      end,
    },
  },
  {
    "andweeb/presence.nvim",
  },
}
