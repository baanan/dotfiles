local cmd = vim.cmd

-- TODO: bring the config out into a seperate file

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UTILITES (utilites.lua)
  use 'tpope/vim-fugitive'     -- git
  use 'simnalamburt/vim-mundo' -- undo tree
  use 'tpope/vim-commentary'   -- commenter
  use 'godlygeek/tabular'      -- :Tab
  use 'famiu/bufdelete.nvim'   -- :bd fixer
  use 'andweeb/presence.nvim'  -- rich presence

  use { 'Shatur/neovim-session-manager', -- session manager
    requires = 'nvim-lua/plenary.nvim',
  }

  -- splits (splits.lua)
  use 'mrjones2014/smart-splits.nvim' -- better split resizing
  use "kwkarlwang/bufresize.nvim"     -- buffers keep proportions

  -- telescope (telescope.lua)
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim',
  }

      -- speed up and fzf syntax
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'fannheyward/telescope-coc.nvim' -- changes coc selectors to telescope
  use 'stevearc/dressing.nvim'         -- changes default selectors to telescope


  -- delimiter and argument stuff (delim-arg.lua)
  use 'FooSoft/vim-argwrap'      -- collapsing and expanding delimiters
  use 'AndrewRadev/sideways.vim' -- moving and moving around arguments
  use 'tpope/vim-endwise'        -- automatically ending structures like lua functions
  use 'jiangmiao/auto-pairs'     -- inserts delimiters in pairs
  use { 'tpope/vim-surround', requires = 'tpope/vim-repeat' } -- delimiter utilites

  -- navigation (navigation.lua)
  use 'wellle/targets.vim'              -- adds various text objects (arguments, next delimiters)
  use 'bkad/CamelCaseMotion'            -- motions inside of different cases
  use 'unblevable/quick-scope'          -- f / F helper
  use 'michaeljsmith/vim-indent-object' -- adds an object based on indentation

  use { 'tpope/vim-unimpaired', requires = 'tpope/vim-repeat' }      -- ]e [e and such
  use { 'easymotion/vim-easymotion', requires = 'tpope/vim-repeat' } -- highlight motions
  use { 'mg979/vim-visual-multi', branch = 'master' }                -- multiple cursor support



  -- VISUALS (visuals.lua)
  use 'joshdick/onedark.vim'

  use 'jeffkreeftmeijer/vim-numbertoggle'   -- numbers switch to absolute when it makes sense
  use 'airblade/vim-gitgutter'              -- shows git diff next to numbers
  use 'lukas-reineke/indent-blankline.nvim' -- indentation guides
  use 'machakann/vim-highlightedyank'       -- yanks highlight what they yank
  use 'luochen1990/rainbow'                 -- rainbow delimiters

  use { "folke/todo-comments.nvim",         -- todo highlighting
    requires = "nvim-lua/plenary.nvim",
  }

  use { 'kevinhwang91/nvim-hlslens',        -- better find highlighting
    requires = 'mg979/vim-visual-multi',
  }

  -- syntax highlighting (treesitter.lua)
  use 'sheerun/vim-polyglot' -- various language packs for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter', -- treesitter stuff
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }


  -- UI (ui.lua)

  use 'stevearc/aerial.nvim'    -- tagtree
  use 'vim-airline/vim-airline' -- statusline

  use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
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
    'petertriho/nvim-scrollbar', -- scrollbar
    requires = 'kevinhwang91/nvim-hlslens',
  }

  use { "akinsho/toggleterm.nvim", tag = '*', } -- terminal 

  use {
    "folke/trouble.nvim", -- diagnostics list
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end
  }



  -- AUTOCOMPLETION
  -- coc
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'rafamadriz/friendly-snippets'

  -- cmp (yes all of this is for command line) (cmp.lua)
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
