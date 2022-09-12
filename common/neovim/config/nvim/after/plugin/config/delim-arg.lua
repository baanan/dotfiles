-- toc 
--   autopairs

-- autopairs
vim.cmd[[
  au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', 'r#"': '"#'})
]]
