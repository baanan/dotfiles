-- toc 
--   commentary
--   session manager
--   telescope

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

-- commentary
nnoremap("<C-_>", "<plug>CommentaryLine")
nnoremap("<C-/>", "<plug>CommentaryLine")
vnoremap("<C-_>", "<plug>Commentary")
vnoremap("<C-/>", "<plug>Commentary")

-- session manager
nnoremap('<leader>ss', '<cmd>SessionManager load_last_session<cr>')
nnoremap('<leader>sl', '<cmd>SessionManager load_session<cr>')

-- telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope file_browser<cr>")
nnoremap("<leader>fc", "<cmd>Telescope commands<cr>")
nnoremap("<leader>fm", "<cmd>Telescope media_files<cr>")
nnoremap("<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

nnoremap("<leader>f:", "<cmd>Telescope command_history<cr>")
nnoremap("<leader>f/", "<cmd>Telescope search_history<cr>")
nnoremap("<leader>f`", "<cmd>Telescope marks<cr>")
nnoremap("<leader>f\"", "<cmd>Telescope registers<cr>")

-- nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
-- nnoremap("<leader>fd", "<cmd>Telescope lsp_definitions<cr>")
