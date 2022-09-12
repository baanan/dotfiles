-- toc 
--   aerial
--   airline
--   bufferline
--   neotree
--   trouble

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap
local nmap = Remap.nmap

-- aerial
nmap("<leader>t", "<cmd>AerialToggle<CR>")

-- airline
vim.g.airline_theme = 'onedark'
vim.g.airline_powerline_fonts = 1

-- bufferline
nnoremap("<C-Tab>", ":tabn<CR>")

--    delete
nnoremap("<Leader><Tab>", ":Bd<CR>")

--    pick
nnoremap("<leader>bb", ":BufferLinePick<CR>")
--    movement
nnoremap("<Tab>", ":BufferLineCycleNext<CR>")
nnoremap("<S-Tab>", ":BufferLineCyclePrev<CR>")

--    moving buffers
nnoremap("<leader>bl", ":BufferLineMoveNext<CR>")
nnoremap("<leader>bh", ":BufferLineMovePrev<CR>")

--    hotkeys
nnoremap("<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
nnoremap("<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
nnoremap("<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
nnoremap("<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
nnoremap("<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
nnoremap("<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
nnoremap("<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
nnoremap("<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
nnoremap("<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
nnoremap("<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>")

-- neotree
nnoremap("<leader>n", ":Neotree<CR>")

-- trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")
