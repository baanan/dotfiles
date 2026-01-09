return {
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        -- TODO = { alt = { "todo!()", "todo" } },
        TODO = { alt = { "todo" } },
      },
      highlight = {
        pattern = { [[.*<(KEYWORDS)\s*:]], [[.*(todo!\(\))]], [[.*(todo)!]] }, -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = false, -- uses treesitter to match keywords in comments only
      },
      search = {
        pattern = [[\b(KEYWORDS):|\b(todo!)]], -- ripgrep regex
      },
    },
  },
}
