-- taken from ThePrimeagen
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/keymap.lua

local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true, silent = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local function unbind(mode)
  return function(lhs)
    vim.keymap.del(mode, lhs)
  end
end

M.nmap = bind("n", { noremap = false, silent = true })
M.noremap = bind("")
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")
M.onoremap = bind("o")
M.cnoremap = bind("c")
M.unmap = unbind("")
M.nunmap = unbind("n")

return M
