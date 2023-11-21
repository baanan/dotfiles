-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local remap = require("util.keymaps")
local nnoremap = remap.nnoremap
local noremap = remap.noremap

nnoremap("<leader>c", [["+]])
nnoremap("<leader>u", "<cmd>redo<cr>")

noremap("0", "^")
noremap("^", "0")

noremap("<leader>c", [["+]]) -- clipboard
