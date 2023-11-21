local bacon
return {
  {
    "Canop/nvim-bacon",
    dependencies = {
      "akinsho/toggleterm.nvim",
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
      },
    },
  },
}
