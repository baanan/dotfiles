return {
  {
    "mrjones2014/smart-splits.nvim", -- better split resizing
    keys = {
      {
        "<A-h>",
        function()
          require("smart-splits").resize_left()
        end,
      },
      {
        "<A-j>",
        function()
          require("smart-splits").resize_down()
        end,
      },
      {
        "<A-k>",
        function()
          require("smart-splits").resize_up()
        end,
      },
      {
        "<A-l>",
        function()
          require("smart-splits").resize_right()
        end,
      },
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
      },
    },
  },
  { "kwkarlwang/bufresize.nvim" }, -- buffers keep proportions
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    version = "*",
    opts = {
      size = 45,
      open_mapping = false,
    },
    init = function()
      require("util.keymaps").tnoremap("<Esc>", [[<C-\><C-n>]])
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    -- this plugin looks really nice but also messes up the smooth scrolling in neovide D:
    cond = function()
      return not vim.g.neovide
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    keys = {
      { "<leader>dd", "<cmd>only<cr><cmd>Dashboard<cr>", desc = "Open Dashboard" },
    },
  },
}
