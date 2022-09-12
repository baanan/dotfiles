-- toc 
--   onedark
--   todo-comments
--   hlslens
--   rainbow

-- onedark
vim.cmd("colorscheme onedark")
vim.cmd("hi Search guibg=#3B4048 guifg=#ABB2BF")

-- todo-comments
require("todo-comments").setup{}

-- hlslens
vim.cmd([[
    aug VMlens
        au!
        au User visual_multi_start lua require('vmlens').start()
        au User visual_multi_exit lua require('vmlens').exit()
    aug END
]])

-- rainbow
vim.opt.termguicolors = true

vim.g.rainbow_active = 0
vim.g.rainbow_conf = {
  guifgs = { '#be5046' , '#e06c75' , '#d19a66' , '#e5c07b' , '#98c379' , '#56b6c2' , '#61afef' , '#c678dd' },
ctermfgs = {       196 ,       204 ,       173 ,       180 ,       114 ,        38 ,        39 ,       170 },
}
