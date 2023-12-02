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
  -- same with easymotion
  { "folke/flash.nvim", enabled = false },
  {
    -- also see persistence in util for a small change that needed to be made
    "easymotion/vim-easymotion",
    dependencies = {
      "tpope/vim-repeat",
    },
    init = function()
      vim.g.EasyMotion_do_mapping = 0 -- disable default keybinds
      vim.g.EasyMotion_smartcase = 1 -- ignore case when searching
    end,
    keys = {
      { "<leader>j", "<plug>(easymotion-j)", mode = { "n", "o" }, desc = "Select a line above" },
      { "<leader>k", "<plug>(easymotion-k)", mode = { "n", "o" }, desc = "Select a line below" },
      { "<leader>L", "<plug>(easymotion-overwin-line)", desc = "Jump to a line anywhere" },
      { "s", "<plug>(easymotion-overwin-f)", desc = "Jump to a character anywhere" },
    },
  },
}
