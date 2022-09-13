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

nnoremap("<Leader>w", "<Plug>(easymotion-bd-w)")
nnoremap("<Leader>L", "<Plug>(easymotion-overwin-line)")

nnoremap("s", "<Plug>(easymotion-overwin-f)")

-- quickscope
vim.g.qs_buftype_blacklist = {'terminal', 'nofile'}

vim.cmd[[
  augroup qs_colors
      autocmd!
      autocmd ColorScheme * highlight QuickScopePrimary guifg='#C678DD' gui=underline ctermfg=170 cterm=underline
      autocmd ColorScheme * highlight QuickScopeSecondary guifg='#D19A66' gui=underline ctermfg=173 cterm=underline
  augroup END
]]
