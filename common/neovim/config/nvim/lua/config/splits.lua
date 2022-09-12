-- toc 
--   smart-splits

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap
local nmap = Remap.nmap

-- smart-splits
-- resizing splits
nmap("<silent>", "<A-h> :lua require('smart-splits').resize_left()<CR>")
nmap("<silent>", "<A-j> :lua require('smart-splits').resize_down()<CR>")
nmap("<silent>", "<A-k> :lua require('smart-splits').resize_up()<CR>")
nmap("<silent>", "<A-l> :lua require('smart-splits').resize_right()<CR>")
-- moving between splits
nmap("<silent>", "<C-h> :lua require('smart-splits').move_cursor_left()<CR>")
nmap("<silent>", "<C-j> :lua require('smart-splits').move_cursor_down()<CR>")
nmap("<silent>", "<C-k> :lua require('smart-splits').move_cursor_up()<CR>")
nmap("<silent>", "<C-l> :lua require('smart-splits').move_cursor_right()<CR>")
