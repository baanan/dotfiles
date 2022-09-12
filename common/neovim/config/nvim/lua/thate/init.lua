require("thate.packer")
require("thate.general")

require("config.delim-arg")
require("config.navigation")
require("config.rust")
require("config.splits")
require("config.ui")
require("config.utilites")
require("config.visuals")

if vim.fn.has('win32') == 1 then
  vim.cmd('source ' .. vim.opt.runtimepath:get()[1] .. [[\lua\config\coc.vim]])
  vim.cmd('source ' .. vim.opt.runtimepath:get()[1] .. [[\lua\config\neovide.vim]])
else
  vim.cmd('source ' .. vim.opt.runtimepath:get()[1] .. [[/lua/config/neovide.vim]])
end
