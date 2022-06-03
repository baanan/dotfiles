" of course
set hidden
set relativenumber number

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" before plugin config
function! g:BuffetSetCustomColors()
    hi! BuffetTrunc cterm=NONE ctermbg=173 ctermfg=235 guibg=#d19a66 guifg=#282c34
    hi! BuffetTab cterm=NONE ctermbg=170 ctermfg=235 guibg=#c678dd guifg=#282c34

    hi! BuffetCurrentBuffer cterm=NONE ctermbg=180 ctermfg=235 guibg=#e5c07b guifg=#282c34
    hi! BuffetActiveBuffer cterm=NONE ctermbg=237 ctermfg=145 guibg=#3e4452 guifg=#abb2bf
    hi! BuffetBuffer cterm=NONE ctermbg=236 ctermfg=145 guibg=#2c323c guifg=#abb2bf
endfunction

" plugins
call plug#begin()

"" utilities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'simnalamburt/vim-mundo'
Plug 'thaerkh/vim-workspace'

Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'takac/vim-hardtime'

""" argument / pair stuff
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'FooSoft/vim-argwrap'

"" nerdtree
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'git@github.com:AndrewRadev/sideways.vim.git'

"" visuals
Plug 'git@github.com:joshdick/onedark.vim.git'

Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'thaerkh/vim-indentguides'

Plug 'bagrat/vim-buffet'
Plug 'vim-airline/vim-airline'

Plug 'machakann/vim-highlightedyank'

"" lsp and autocomplete
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

""" rust
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'

""" snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

""" visuals
Plug 'git@github.com:onsails/lspkind.nvim.git'

"" plugins end
call plug#end()

syntax enable
filetype plugin indent on

" plugin config
lua require'nvim-treesitter.configs'.setup { ensure_installed = { "rust", "toml", "regex", "vim", "lua", "java",  "json", "python", "yaml", "bash" }, hightlight = { enable = true, } }

"" hardtime
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "__Tagbar__.", "/doc/", "/.git/" ]

"" vim buffet
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

"" other utilities
let g:highlightedyank_highlight_duration = 250

"" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

"" vim-workspace
let g:workspace_create_new_tabs = 0

""" fix for nerdtree
autocmd VimLeave * NERDTreeClose | doautocmd BufLeave

"" tagbar
let g:tagbar_autoclose = 1

" nerdtree
let g:NERDTreeGitStatusUseNerdFonts = 1 

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" keybinds
let mapleader = " "

nnoremap <leader>p "+
nnoremap <leader>r <cmd>redo<cr>

"" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>

nnoremap <leader>f: <cmd>Telescope command_history<cr>
nnoremap <leader>f/ <cmd>Telescope search_history<cr>
nnoremap <leader>f` <cmd>Telescope marks<cr>
nnoremap <leader>f" <cmd>Telescope registers<cr>

nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
nnoremap <leader>fd <cmd>Telescope lsp_definitions<cr>

"" vim buffet
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

"" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"" mundo
nnoremap <F5> :MundoToggle<CR>

"" nerdcommenter
nnoremap <C-_> <plug>NERDCommenterInvert<CR>
vnoremap <C-_> <plug>NERDCommenterToggle<CR>

"" arguments
nnoremap <silent> <leader>az :ArgWrap<CR>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

nmap <leader>ai <Plug>SidewaysArgumentInsertBefore
nmap <leader>aa <Plug>SidewaysArgumentAppendAfter
nmap <leader>aI <Plug>SidewaysArgumentInsertFirst
nmap <leader>aA <Plug>SidewaysArgumentAppendLast

nnoremap <leader>al <cmd>SidewaysJumpRight<cr>
inoremap <C-l> <cmd>SidewaysJumpRight<cr>
nnoremap <leader>ah <cmd>SidewaysJumpLeft<cr>
inoremap <C-j> <cmd>SidewaysJumpLeft<cr>

nnoremap <leader>aml <cmd>SidewaysRight<cr>
nnoremap <leader>amh <cmd>SidewaysLeft<cr>

"" tagbar
nmap <leader>t :TagbarToggle<CR>

" themes
colorscheme onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set completeopt=menu,menuone,noselect

lua <<EOF
    require("nvim-lsp-installer").setup({
        ensure_installed = { "rust_analyzer" },
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    })

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
    end

    local servers = { 'rust_analyzer', 'sumneko_lua', 'vimls', 'jdtls', 'taplo', 'bashls' }
    for _, lsp in pairs(servers) do
      require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
EOF
