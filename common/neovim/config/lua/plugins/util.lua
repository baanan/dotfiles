return {
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
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("remote-sshfs").setup({})
      require('telescope').load_extension 'remote-sshfs'
    end,
  }
  -- {
  --   "amitds1997/remote-nvim.nvim",
  --   version = "*", -- Pin to GitHub releases
  --   dependencies = {
  --       "nvim-lua/plenary.nvim", -- For standard functions
  --       "MunifTanjim/nui.nvim", -- To build the plugin UI
  --       "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  --   },
  --   config = true,
  -- }
  -- {
  --   "andweeb/presence.nvim",
  -- },
}
