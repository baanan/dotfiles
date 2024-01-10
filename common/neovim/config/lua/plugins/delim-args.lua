return {
  {
    "FooSoft/vim-argwrap",
    init = function()
      vim.g.argwrap_padded_braces = "{"
      vim.g.argwrap_tail_comma = 1
    end,
    keys = {
      { "<leader>az", "<cmd>ArgWrap<CR>", desc = "Fold/unfold delimiters" },
    },
  },
  {
    "AndrewRadev/sideways.vim",
    keys = {
      { "<leader>ai", "<Plug>SidewaysArgumentInsertBefore", silent = true, desc = "Add argument before current" },
      { "<leader>aa", "<Plug>SidewaysArgumentAppendAfter", silent = true, desc = "Add argument after current" },
      {
        "<leader>aI",
        "<Plug>SidewaysArgumentInsertFirst",
        silent = true,
        desc = "Add new argument before all others",
      },
      {
        "<leader>aA",
        "<Plug>SidewaysArgumentAppendLast",
        silent = true,
        desc = "Add new argument after all others",
      },
      { "<leader>al", "<cmd>SidewaysJumpRight<cr>", desc = "Move to next argument" },
      { "<leader>ah", "<cmd>SidewaysJumpLeft<cr>", desc = "Move to previous arugment" },
      { "<leader>aml", "<cmd>SidewaysRight<cr>", desc = "Swap argument with next" },
      { "<leader>amh", "<cmd>SidewaysLeft<cr>", desc = "Swap argument with previous" },
      { "<C-l>", "<cmd>SidewaysJumpRight<cr>", mode = "i", desc = "Swap argument with next" },
      { "<C-j>", "<cmd>SidewaysJumpLeft<cr>", mode = "i", desc = "Swap argument with previous" },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ys", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "cs", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
}
