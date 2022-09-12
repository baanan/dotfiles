-- toc 
--   bacon

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap

-- bacon
nnoremap("!", ":BaconLoad<CR>:w<CR>:BaconNext<CR>")
nnoremap(",", ":BaconList<CR>")
