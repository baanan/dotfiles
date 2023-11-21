return {
  -- add <leader>j and <leader>k to flash
  {
    "folke/flash.nvim",
    keys = {
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = true },
            highlight = { matches = false },
            pattern = "^\\s*",
          })
        end,
        desc = "Flash Line",
      },
      {
        "<leader>k",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = true },
            highlight = { matches = false },
            pattern = "^\\s*",
          })
        end,
        desc = "Flash Line",
      },
    },
  },
  -- multiple cursor support
  {
    "mg979/vim-visual-multi",
    branch = "master",
    keys = {
      -- readd these keys because lazyvim overwrites them
      { "<C-Up>", "<Plug>(VM-Add-Cursor-Up)" },
      { "<C-Down>", "<Plug>(VM-Add-Cursor-Down)" },
    },
  },
  -- jiangmiao/auto-pairs is more feature-rich
  { "echasnovski/mini.pairs", enabled = false },
  {
    "jiangmiao/auto-pairs",
    init = function()
      -- add some rust-specific auto pairs
      vim.cmd([[
        au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', 'r#"': '"#'})
      ]])
    end,
  },
}
