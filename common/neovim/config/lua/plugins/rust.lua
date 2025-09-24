local bacon
return {
  {
    "Canop/nvim-bacon",
    dependencies = {
      { "akinsho/toggleterm.nvim" },
    },
    opts = {
      quickfix = {
        enabled = true,
        event_trigger = true,
      }
    },
    init = function()
      -- create bacon terminal when started so it can be opened later
      bacon = require("toggleterm.terminal").Terminal:new({
        cmd = "bacon",
        direction = "vertical",
      })
    end,
    keys = {
      { "!", "<cmd>BaconLoad<cr><cmd>BaconNext<cr>" },
      {
        "<leader>bc",
        function()
          -- toggle the bacon terminal
          bacon:toggle()
        end,
        desc = "Open Bacon (Rust)",
      },
    },
  },
  -- prevent rust_analyzer from being in lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            targetDir = true,
          },
        },
      },
    },
  }
}
