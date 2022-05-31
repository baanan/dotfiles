# of course
set hidden

# plugins
call plug#begin()

## fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

## plugins end
call plug#end()
