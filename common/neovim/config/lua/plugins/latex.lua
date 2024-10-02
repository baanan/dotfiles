return {
  -- automatic compiling and opening of latex files
  -- as well as a lot of motions
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.tex_flavor = "latex"

      -- TODO: add whichkey things for vimtex binds
      require("which-key").add({
        { "<localleader>l", group = "vimtex" },
        { "<localleader>ll", desc = "Start Compilation" },
        { "<localleader>lt", "<plug>(vimtex-toc-toggle)", desc = "Toggle Table of Contents" },
        { "<localleader>lv", desc = "Open Viewer" },
        { "<localleader>lr", desc = "Jump to Position in Viewer" },
        { "<localleader>lk", desc = "Stop" },
        { "<localleader>lx", desc = "Reload" },
      })
    end,
  },
  -- using ultisnips for vim snippets
  -- it's powerful and Gilles Castel's snippets are all in in
  {
    "SirVer/ultisnips",
    init = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "quangnguyen30192/cmp-nvim-ultisnips" },
    },
    opts = function(_, opts)
      opts.snippet = {
        expand = function(item)
          if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            vim.fn["UltiSnips#Anon"](item.body)
          else
            return LazyVim.cmp.expand(item.body)
          end
        end,
      }

      table.insert(opts.sources, { name = "ultisnips" })
    end,
    init = function()
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      local function wrap_cmp(cmp_function)
        SUCCESS = true
        local fallback = function()
          SUCCESS = false
        end

        cmp_function(fallback)

        return SUCCESS
      end

      require("which-key").add({
        {
          "<Tab>",
          function()
            return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>"
              or wrap_cmp(cmp_ultisnips_mappings.expand_or_jump_forwards) and nil
              or "<Tab>"
          end,
          expr = true,
          mode = { "i", "s" },
        },
        {
          "<S-Tab>",
          function()
            return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>"
              or wrap_cmp(cmp_ultisnips_mappings.jump_backwards) and nil
              or "<S-Tab>"
          end,
          expr = true,
          mode = { "i", "s" },
        },
      })
    end,
  },
}
