local cmd = vim.cmd

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UTILITES
  use 'tpope/vim-fugitive'     -- git
  use 'simnalamburt/vim-mundo' -- undo tree
  use 'stevearc/aerial.nvim'   -- tagtree
  use 'tpope/vim-commentary'   -- commenter
  use 'godlygeek/tabular'      -- :Tab
  use 'famiu/bufdelete.nvim'   -- :bd fixer
  use 'andweeb/presence.nvim'  -- rich presence

  use {
    'Shatur/neovim-session-manager', -- session manager
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('session_manager').setup({
        autosave_ignore_not_normal = false,
        autosave_ignore_filetypes = {
          'gitcommit',
          'toggleterm',
        },
    })
    end
  }

  use {
    'mrjones2014/smart-splits.nvim', -- better split resizing
    config = function ()
      require('smart-splits').setup({
        resize_mode = {
          hooks = {
            on_leave = require('bufresize').register
          }
        }
      })
    end
  }

  use {
    "kwkarlwang/bufresize.nvim", -- buffers keep proportions
    config = function() require("bufresize").setup() end
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require("telescope").setup({
        extensions = {
          coc = {
              prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
          }
        },
      })
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('coc')
    end
  }

      -- speed up and fzf syntax
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'fannheyward/telescope-coc.nvim' -- changes coc selectors to telescope
  use 'stevearc/dressing.nvim'         -- changes default selectors to telescope


  -- delimiter and argument stuff
  use 'FooSoft/vim-argwrap'      -- collapsing and expanding delimiters
  use 'AndrewRadev/sideways.vim' -- moving and moving around arguments
  use 'tpope/vim-endwise'        -- automatically ending structures like lua functions
  use { 'tpope/vim-surround', requires = 'tpope/vim-repeat' } -- delimiter utilites
  use {
    'jiangmiao/auto-pairs',     -- inserts delimiters in pairs
    function ()
      cmd[[
        au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', 'r#"': '"#'})
      ]]
    end
  }

  -- navigation
  use 'wellle/targets.vim'              -- adds various text objects (arguments, next delimiters)
  use 'bkad/CamelCaseMotion'            -- motions inside of different cases
  use 'unblevable/quick-scope'          -- f / F helper
  use 'michaeljsmith/vim-indent-object' -- adds an object based on indentation

  use { 'tpope/vim-unimpaired', requires = 'tpope/vim-repeat' }      -- ]e [e and such
  use { 'easymotion/vim-easymotion', requires = 'tpope/vim-repeat' } -- highlight motions
  use { 'mg979/vim-visual-multi', branch = 'master' }                -- multiple cursor support



  -- VISUALS
  use {
    'joshdick/onedark.vim',
    config = function ()
      cmd("colorscheme onedark")
      cmd("hi Search guibg=#3B4048 guifg=#ABB2BF")
    end
  }

  use 'jeffkreeftmeijer/vim-numbertoggle'   -- numbers switch to absolute when it makes sense
  use 'airblade/vim-gitgutter'              -- shows git diff next to numbers
  use 'lukas-reineke/indent-blankline.nvim' -- indentation guides
  use 'machakann/vim-highlightedyank'       -- yanks highlight what they yank
  use 'luochen1990/rainbow'                 -- rainbow delimiters


  use {
    "folke/trouble.nvim", -- diagnostics list
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end
  }

  use {
    "akinsho/toggleterm.nvim", tag = '*', -- terminal
    config = function()
      require("toggleterm").setup{
        -- open_mapping = 'gt',
        direction = 'tab',
        shell = vim.fn.has('unix') and vim.o.shell or 'pwsh',
      }
    end
  }

  use {
    "folke/todo-comments.nvim", -- todo highlighting
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end
  }

  use {
    'vim-airline/vim-airline', -- statusline
    config = function ()
      vim.g.airline_theme = 'onedark'
      vim.g.airline_powerline_fonts = 1
    end
  }

  use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require("bufferline").setup{
        options = {
          offsets = {{filetype = "neo-tree", text = "File Explorer", text_align = "center", padding = 1}},
        }
      }
    end
  }

  cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'kevinhwang91/nvim-hlslens', -- better find highlighting
    requires = 'mg979/vim-visual-multi',
    config = function ()
      cmd([[
          aug VMlens
              au!
              au User visual_multi_start lua require('vmlens').start()
              au User visual_multi_exit lua require('vmlens').exit()
          aug END
      ]])
    end
  }

  use {
    'petertriho/nvim-scrollbar', -- scrollbar
    requires = 'kevinhwang91/nvim-hlslens',
    config = function ()
      require("scrollbar.handlers.search").setup()
      require("scrollbar").setup({
        handle = { color = "#3E4452", cterm = 237 },
        marks = {
          Search = { color = "#D19A66", cterm = 173 }, -- dark yellow
          Error  = { color = "#E06C75", cterm = 204 }, -- red
          Warn   = { color = "#E5C07B", cterm = 180 }, -- yellow
          Info   = { color = "#61AFEF", cterm = 39  }, -- blue
          Hint   = { color = "#56B6C2", cterm = 38  }, -- cyan
          Misc   = { color = "#C678DD", cterm = 170 }, -- purple
        }
      })
    end
  }


  -- syntax highlighting
  use 'sheerun/vim-polyglot' -- various languague packs for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter', -- treesitter stuff
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function ()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "rust", "toml", "regex", "vim", "lua", "java", "json", "python", "yaml", "bash" },
        hightlight = { enable = true },
        sync_install = true,
      }
    end
  }




  -- AUTOCOMPLETION
  -- coc
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'rafamadriz/friendly-snippets'

  -- cmp (yes all of this is for command line)
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'onsails/lspkind.nvim'

  use 'hrsh7th/nvim-cmp'



  -- RUST
  use 'rust-lang/rust.vim'
  use 'Canop/nvim-bacon'
end)
