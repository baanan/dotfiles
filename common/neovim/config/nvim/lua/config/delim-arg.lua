-- toc 
--   argwrap
--   autopairs
--   sideways

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

-- argwrap
nnoremap("<leader>az", ":ArgWrap<CR>")

-- autopairs
vim.cmd[[
  au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', 'r#"': '"#'})
]]

-- sideways
nmap("<leader>ai", "<Plug>SidewaysArgumentInsertBefore")
nmap("<leader>aa", "<Plug>SidewaysArgumentAppendAfter")
nmap("<leader>aI", "<Plug>SidewaysArgumentInsertFirst")
nmap("<leader>aA", "<Plug>SidewaysArgumentAppendLast")

nnoremap("<leader>al", "<cmd>SidewaysJumpRight<cr>")
inoremap("<C-l>", "<cmd>SidewaysJumpRight<cr>")
nnoremap("<leader>ah", "<cmd>SidewaysJumpLeft<cr>")
inoremap("<C-j>", "<cmd>SidewaysJumpLeft<cr>")

nnoremap("<leader>aml", "<cmd>SidewaysRight<cr>")
nnoremap("<leader>amh", "<cmd>SidewaysLeft<cr>")
