return {
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
  -- { "echasnovski/mini.pairs", enabled = false },
  -- {
  --   "jiangmiao/auto-pairs",
  --   init = function()
  --     -- add some rust-specific auto pairs
  --     vim.cmd([[
  --       au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', 'r#"': '"#'})
  --     ]])
  --   end,
  -- },
  -- same with easymotion
  { "folke/flash.nvim", enabled = false },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    keys = {
      { "s", "<cmd>HopChar1MW<cr>", desc = "Hop to any specified character anywhere on the screen" },
      { "<leader>j", "<cmd>HopLineStartAC<cr>", desc = "Hop to any line below the current one" },
      { "<leader>k", "<cmd>HopLineStartBC<cr>", desc = "Hop to any line above the current one" },
    },
  },
  -- {
  --   -- also see persistence in util for a small change that needed to be made
  --   "easymotion/vim-easymotion",
  --   dependencies = {
  --     "tpope/vim-repeat",
  --   },
  --   init = function()
  --     vim.g.EasyMotion_do_mapping = 0 -- disable default keybinds
  --     vim.g.EasyMotion_smartcase = 1 -- ignore case when searching
  --   end,
  --   keys = {
  --     { "<leader>j", "<plug>(easymotion-j)", mode = { "n", "o" }, desc = "Select a line above" },
  --     { "<leader>k", "<plug>(easymotion-k)", mode = { "n", "o" }, desc = "Select a line below" },
  --     { "<leader>L", "<plug>(easymotion-overwin-line)", desc = "Jump to a line anywhere" },
  --     { "s", "<plug>(easymotion-overwin-f)", desc = "Jump to a character anywhere" },
  --   },
  -- },
  -- motion in different cases
  {
    "bkad/CamelCaseMotion",
    keys = {
      { "gw", "<plug>CamelCaseMotion_w", mode = { "n", "v", "o" } },
      { "gb", "<plug>CamelCaseMotion_b", mode = { "n", "v", "o" } },
      { "ge", "<plug>CamelCaseMotion_e", mode = { "n", "v", "o" } },
      { "gE", "<plug>CamelCaseMotion_ge", mode = { "n", "v", "o" } },
      { "gw", "<plug>CamelCaseMotion_iw", mode = { "o", "x" } },
      { "gb", "<plug>CamelCaseMotion_ib", mode = { "o", "x" } },
      { "ge", "<plug>CamelCaseMotion_ie", mode = { "o", "x" } },
    },
  },
}
