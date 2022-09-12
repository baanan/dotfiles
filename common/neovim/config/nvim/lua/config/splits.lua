-- toc 
--   smart-splits

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap
local nmap = Remap.nmap

-- smart-splits
-- resizing splits
nmap("<A-h>", ":lua require('smart-splits').resize_left()<CR>")
nmap("<A-j>", ":lua require('smart-splits').resize_down()<CR>")
nmap("<A-k>", ":lua require('smart-splits').resize_up()<CR>")
nmap("<A-l>", ":lua require('smart-splits').resize_right()<CR>")
-- moving between splits
nmap("<C-h>", ":lua require('smart-splits').move_cursor_left()<CR>")
nmap("<C-j>", ":lua require('smart-splits').move_cursor_down()<CR>")
nmap("<C-k>", ":lua require('smart-splits').move_cursor_up()<CR>")
nmap("<C-l>", ":lua require('smart-splits').move_cursor_right()<CR>")
