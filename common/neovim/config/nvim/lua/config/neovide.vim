if exists("g:neovide")

  let g:neovide_remember_window_size = v:true

  if has('mac')
    let s:fontsize = 14
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h14

    function! AdjustFontSize(amount)
      let s:fontsize = s:fontsize+a:amount
      :execute "set guifont=JetBrainsMono\\ Nerd\\ Font\\ Mono:h" . s:fontsize
    endfunction

  else
    let s:fontsize = 13
    set guifont=JetBrainsMonoNL\ Nerd\ Font\ Mono:h13

    function! AdjustFontSize(amount)
      let s:fontsize = s:fontsize+a:amount
      :execute "set guifont=JetBrainsMonoNL\\ Nerd\\ Font\\ Mono:h" . s:fontsize
    endfunction

  endif

  " In normal mode, pressing numpad's+ increases the font
  nnoremap <C-+> :call AdjustFontSize(1)<CR>
  nnoremap <C--> :call AdjustFontSize(-1)<CR>

  " In insert mode, pressing ctrl + numpad's+ increases the font
  inoremap <C-+> <Esc>:call AdjustFontSize(1)<CR>a
  inoremap <C--> <Esc>:call AdjustFontSize(-1)<CR>a

endif
