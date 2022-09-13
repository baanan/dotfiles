-- toc 
--   onedark
--   highlightedyank
--   hlslens
--   rainbow

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap

-- onedark
vim.cmd("colorscheme onedark")
vim.cmd("hi Search guibg=#3B4048 guifg=#ABB2BF")

-- highlightedyank
vim.g.highlightedyank_highlight_duration = 250

-- hlslens
nnoremap("n", "<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>")
nnoremap("N", "<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>")

nnoremap("*", "*<Cmd>lua require('hlslens').start()<CR>")
nnoremap("#", "#<Cmd>lua require('hlslens').start()<CR>")
nnoremap("g*", "g*<Cmd>lua require('hlslens').start()<CR>")
nnoremap("g#", "g#<Cmd>lua require('hlslens').start()<CR>")

nnoremap("<leader>l", ":noh<CR>")

-- rainbow
vim.g.rainbow_active = 0
vim.g.rainbow_conf = {
  guifgs = { '#be5046' , '#e06c75' , '#d19a66' , '#e5c07b' , '#98c379' , '#56b6c2' , '#61afef' , '#c678dd' },
ctermfgs = {       196 ,       204 ,       173 ,       180 ,       114 ,        38 ,        39 ,       170 },
}
