" of course
set hidden
set relativenumber number

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

""" utilities
Plug 'tpope/vim-fugitive'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'takac/vim-hardtime'

""" nerdtree
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

""" visuals
Plug 'git@github.com:joshdick/onedark.vim.git'

Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'bagrat/vim-buffet'
Plug 'vim-airline/vim-airline'

"" ctrlspace, nerdtree 

"" plugins end
call plug#end()

" plugin config
lua require'nvim-treesitter.configs'.setup { ensure_installed = { "rust", "toml", "regex", "vim", "lua", "java",  "json", "python", "yaml", "bash" }, hightlight = { enable = true, } }

"" hardtime
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]

"" vim buffet
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

"" nerdtree
let g:NERDTreeGitStatusUseNerdFonts = 1 

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" keybinds
let mapleader = " "

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

nnoremap <leader>c "+

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

" themes
syntax on
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
