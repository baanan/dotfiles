" of course
set hidden
set relativenumber number
set updatetime=100

set mouse=a

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

Plug 'andweeb/presence.nvim'

"" utilities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'simnalamburt/vim-mundo'
Plug 'thaerkh/vim-workspace'

" Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'unblevable/quick-scope'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Plug 'takac/vim-hardtime'

""" argument stuff
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/sideways.vim'

""" autopairs
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'

""" navigation
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'bkad/CamelCaseMotion'

"" nerdtree
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

"" visuals
Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'

Plug 'kevinhwang91/nvim-hlslens'
Plug 'petertriho/nvim-scrollbar'

Plug 'bagrat/vim-buffet'
Plug 'vim-airline/vim-airline'

Plug 'machakann/vim-highlightedyank'
Plug 'luochen1990/rainbow'

"" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rafamadriz/friendly-snippets'

"" command line completion
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'onsails/lspkind.nvim'

"" rust
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'

"" dependents on visuals
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'

" generic keybinds" keybinds
let mapleader = " "

nnoremap <leader>p "+
nnoremap <leader>u <cmd>redo<cr>

inoremap <Home> 
vnoremap <Home> 

tnoremap <Esc> <C-\><C-n>

noremap 0 ^
noremap ^ 0

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

"" autopairs
" let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutJump = 'C-n'
" let g:AutoPairsShortcutBackInsert = 'C-b'
au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', 'r#"': '"#'})

"" vim rainbow
let g:rainbow_active = 0

let g:rainbow_conf = {
\	'guifgs':   [ '#be5046' , '#e06c75' , '#d19a66' , '#e5c07b' , '#98c379' , '#56b6c2' , '#61afef' , '#c678dd' ] ,
\   'ctermfgs': [       196 ,       204 ,       173 ,       180 ,       114 ,        38 ,        39 ,       170 ] ,
\   'separately': {
\       'nerdtree': 0,
\   },
\}

"" nerdtree
let g:NERDTreeGitStatusUseNerdFonts = 1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" quick-scope
let g:qs_buftype_blacklist = ['terminal', 'nofile']

"" easymotion
let g:EasyMotion_smartcase = 1

""" nvim hlslens
aug VMlens
    au!
    au User visual_multi_start lua require('vmlens').start()
    au User visual_multi_exit lua require('vmlens').exit()
aug END

augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#C678DD' gui=underline ctermfg=170 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#D19A66' gui=underline ctermfg=173 cterm=underline
augroup END

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" coc
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xnoremap <leader>rf  <Plug>(coc-codeaction-cursor)
nnoremap <leader>rf  <Plug>(coc-codeaction-cursor)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>
"

"" camel case motion
" let g:camelcasemotion_key = '<leader>'
noremap <leader>W W
noremap <leader>B B
noremap <leader>E E
noremap <leader>gE gE

noremap <silent> W <Plug>CamelCaseMotion_w
noremap <silent> B <Plug>CamelCaseMotion_b
noremap <silent> E <Plug>CamelCaseMotion_e
noremap <silent> gE <Plug>CamelCaseMotion_ge

onoremap i<leader>W iW
xnoremap i<leader>W iW

onoremap <silent> iW <Plug>CamelCaseMotion_iw
xnoremap <silent> iW <Plug>CamelCaseMotion_iw

imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w

"" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fl <cmd>Telescope current_buffer_fuzzy_find<cr>

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
nnoremap <C-_> <plug>CommentaryLine
vnoremap <C-_> <plug>Commentary

"" arguments
nnoremap <silent> <leader>az :ArgWrap<CR>

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

"" trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

"" easymotion
omap <Leader>j <Plug>(easymotion-j)
nmap <Leader>j <Plug>(easymotion-j)
omap <Leader>k <Plug>(easymotion-k)
nmap <Leader>k <Plug>(easymotion-k)

nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>L <Plug>(easymotion-overwin-line)

nmap s <Plug>(easymotion-overwin-f)

"" hlslens
nnoremap n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
nnoremap N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>

nnoremap * *<Cmd>lua require('hlslens').start()<CR>
nnoremap # #<Cmd>lua require('hlslens').start()<CR>
nnoremap g* g*<Cmd>lua require('hlslens').start()<CR>
nnoremap g# g#<Cmd>lua require('hlslens').start()<CR>

nnoremap <leader>l :noh<CR>

" themes
colorscheme onedark
hi Search guibg=#3B4048 guifg=#ABB2BF

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

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
    require("trouble").setup {}
    require("todo-comments").setup {}

    require('telescope').setup {}
    require('telescope').load_extension('fzf')

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

    -- Setup nvim-cmp.
    local cmp = require'cmp'
    local lspkind = require('lspkind')

    cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
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
    })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {

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
EOF
