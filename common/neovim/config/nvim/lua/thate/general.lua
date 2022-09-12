local Remap = require("thate.keymap")
local noremap = Remap.noremap
local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap

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
for mode in {'n', 'v', 'o', 'x', 's', 'i', 'c', 't'} do
  vim.api.nvim_set_keymap(mode, "<Home>", "^[", {})
end

-- keybinds
vim.opt.mapleader = " "

nnoremap("<leader>c", [["+]])
nnoremap("<leader>u", "<cmd>redo<cr>")

tnoremap("<Esc>", [[<C-\><C-n>]])

noremap("0", "^")
noremap("^", "0")
