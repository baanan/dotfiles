-- toc 
--   camel case motion
--   easymotion
--   quick-scope

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap
local onoremap = Remap.onoremap

-- camel case motion
vim.g.camelcasemotion_key = '<leader>'

-- easymotion
vim.g.EasyMotion_smartcase = 1

onoremap("<Leader>j", "<Plug>(easymotion-j)")
nnoremap("<Leader>j", "<Plug>(easymotion-j)")
onoremap("<Leader>k", "<Plug>(easymotion-k)")
nnoremap("<Leader>k", "<Plug>(easymotion-k)")

nnoremap("<Leader>L", "<Plug>(easymotion-overwin-line)")

nnoremap("s", "<Plug>(easymotion-overwin-f)")

vim.cmd[[
  let g:easymotion#is_active = 0
  function! EasyMotionCoc() abort
    if EasyMotion#is_active()
      let g:easymotion#is_active = 1
      silent! CocDisable
    else
      if g:easymotion#is_active == 1
        let g:easymotion#is_active = 0
        silent! CocEnable
      endif
    endif
  endfunction
  autocmd TextChanged,CursorMoved * call EasyMotionCoc()
]]

-- quickscope
vim.g.qs_buftype_blacklist = {'terminal', 'nofile'}

vim.cmd[[
  augroup qs_colors
      autocmd!
      autocmd ColorScheme * highlight QuickScopePrimary guifg='#C678DD' gui=underline ctermfg=170 cterm=underline
      autocmd ColorScheme * highlight QuickScopeSecondary guifg='#D19A66' gui=underline ctermfg=173 cterm=underline
  augroup END
]]
