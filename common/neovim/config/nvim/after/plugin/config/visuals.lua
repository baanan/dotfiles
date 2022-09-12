-- toc 
--   onedark
--   todo-comments
--   hlslens

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
