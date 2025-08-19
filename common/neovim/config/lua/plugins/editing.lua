---@return Regex
local function start_of_line_matcher()
  local regex = vim.regex("\\S")
  local window = require("hop.window")

  return {
    oneshot = true,
    ---@param jctx JumpContext
    match = function(s, jctx)
      if window.is_active_line(jctx.win_ctx, jctx.line_ctx) then
        return
      end
      local match = regex:match_str(s)
      return match or 0, 1
    end,
  }
end

---@param matcher Regex
---@param opts Options
local function hop_matcher(matcher, opts, callback)
  opts = setmetatable(opts, { __index = require("hop").opts })
  require("hop").hint_with_regex(matcher, opts, callback)
end

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
      {
        "s",
        "<cmd>HopChar1MW<cr>",
        desc = "Hop to any specified character anywhere on the screen",
        mode = { "n", "x", "o" },
      },
      {
        "<leader>j",
        function()
          local opts = {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          }
          hop_matcher(start_of_line_matcher(), opts)
        end,
        desc = "Hop to any line below the current one",
        mode = { "n", "x" },
      },
      {
        "<leader>j",
        function()
          local opts = {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          }
          vim.cmd("normal! V")
          hop_matcher(start_of_line_matcher(), opts)
        end,
        desc = "Hop to any line below the current one",
        mode = { "o" },
      },
      {
        "<leader>k",
        function()
          local opts = {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          }
          hop_matcher(start_of_line_matcher(), opts)
        end,
        desc = "Hop to any line above the current one",
        mode = { "n", "x" },
      },
      {
        "<leader>k",
        function()
          local opts = {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          }
          vim.cmd("normal! V")
          hop_matcher(start_of_line_matcher(), opts)
        end,
        desc = "Hop to any line below the current one",
        mode = { "o" },
      },
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
      { "gw", "<plug>CamelCaseMotion_w", mode = { "n", "x", "o" } },
      { "gb", "<plug>CamelCaseMotion_b", mode = { "n", "x", "o" } },
      { "ge", "<plug>CamelCaseMotion_e", mode = { "n", "x", "o" } },
      { "gE", "<plug>CamelCaseMotion_ge", mode = { "n", "x", "o" } },
      { "gw", "<plug>CamelCaseMotion_iw", mode = { "o", "x" } },
      { "gb", "<plug>CamelCaseMotion_ib", mode = { "o", "x" } },
      { "ge", "<plug>CamelCaseMotion_ie", mode = { "o", "x" } },
    },
  },
}
