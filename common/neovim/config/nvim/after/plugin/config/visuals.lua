-- toc 
--   todo-comments
--   hlslens

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

