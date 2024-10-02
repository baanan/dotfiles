local Util = require("lazyvim.util")
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
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 10
        elseif term.direction == "vertical" then
          return 45
        end
      end,
      direction = "vertical",
      open_mapping = false, -- we do it manually, lazily
    },
    keys = {
      { "<c-t>", "<cmd>ToggleTerm<cr>", desc = "Open Terminal" },
      { "<c-s-t>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open Terminal" },
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
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        pickers = {
          git_files = { recurse_submodules = true },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          local win = require("aerial.window")
          if win.is_open() then
            win.close()
          end
          require("neo-tree.command").execute({ toggle = true, action = "show", dir = Util.root(), reveal = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>a",
        function()
          local manager = require("neo-tree.sources.manager")
          local renderer = require("neo-tree.ui.renderer")
          if renderer.tree_is_visible(manager.get_state("filesystem")) then
            manager.close_all()
          end
          require("aerial").open({ focus = false, direction = "left" })
        end,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = true, show_end = true },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },
}
