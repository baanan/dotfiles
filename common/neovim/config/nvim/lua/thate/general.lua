local Remap = require("thate.keymap")
local noremap = Remap.noremap
local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap
local xnoremap = Remap.xnoremap
local vnoremap = Remap.vnoremap
local cnoremap = Remap.cnoremap

vim.opt.termguicolors = true

vim.opt.hidden = true
vim.opt.updatetime = 50
vim.opt.mouse = 'a'

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.completeopt = {'menu','menuone','noselect'}

vim.cmd[[
  syntax enable
  filetype plugin indent on
]]

-- globally rebind home to escape
local modes = {'n', 'v', 'o', 'x', 's', 'i', 'c', 't'}
for _, mode in ipairs(modes) do
  vim.api.nvim_set_keymap(mode, "<Home>", "^[", {})
end

-- keybinds
vim.g.mapleader = " "

nnoremap("<leader>c", [["+]])
nnoremap("<leader>u", "<cmd>redo<cr>")

tnoremap("<Esc>", [[<C-\><C-n>]])

noremap("0", "^")
noremap("^", "0")

noremap("<leader>c", [["+]]) -- clipboard

cnoremap("<C-v>", [[<C-r>"]]) -- pasting in command line

-- stolen from the primeagen
--     see config.visuals hlslens for n/N
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

xnoremap("<leader>p", [["_dP]]) -- keeps old clipboard

nnoremap("<leader>d", [["_d]]) -- deletes but doesn't change clipboard
vnoremap("<leader>d", [["_d]])
