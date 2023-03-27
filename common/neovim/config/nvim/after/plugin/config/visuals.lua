-- toc 
--   todo-comments
--   hlslens

-- todo-comments
require("todo-comments").setup{
    keywords = {
        TODO = { alt = { "todo!()", "todo" } },
    },
    highlight = {
        pattern = { [[.*<(KEYWORDS)\s*:]], [[.*(todo!\(\))]], [[.*(todo)!]] }, -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = false, -- uses treesitter to match keywords in comments only
    },
    search = {
        pattern = [[\b(KEYWORDS):|\b(todo!)]], -- ripgrep regex
    }
}

-- hlslens
vim.cmd([[
    aug VMlens
        au!
        au User visual_multi_start lua require('vmlens').start()
        au User visual_multi_exit lua require('vmlens').exit()
    aug END
]])

