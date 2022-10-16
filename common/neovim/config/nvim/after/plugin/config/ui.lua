-- toc 
--   aerial
--   bufferline
--   neotree
--   scrollbar
--   toggleterm
--   trouble

local Remap = require("thate.keymap")
local nnoremap = Remap.nnoremap

-- aerial
require("aerial").setup({
  layout = {
    width = 25,
    default_direction = "prefer_left",
  }
})

-- bufferline
require("bufferline").setup{
  options = {
    offsets = {
      {filetype = "neo-tree", text = "File Explorer", text_align = "center", padding = 1},
      {filetype = "aerial",   text = "Tag Tree",      text_align = "center", padding = 1},
    },
  }
}

-- neotree
require("neo-tree").setup({
  window = {
    width = 25
  }
})

-- scrollbar
require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
  handle = { color = "#3E4452", cterm = 237 },
  marks = {
    Search = { color = "#D19A66", cterm = 173 }, -- dark yellow
    Error  = { color = "#E06C75", cterm = 204 }, -- red
    Warn   = { color = "#E5C07B", cterm = 180 }, -- yellow
    Info   = { color = "#61AFEF", cterm = 39  }, -- blue
    Hint   = { color = "#56B6C2", cterm = 38  }, -- cyan
    Misc   = { color = "#C678DD", cterm = 170 }, -- purple
  }
})

-- toggleterm
require("toggleterm").setup{
  -- open_mapping = 'gt',
  size = 45,
  direction = 'vertical',
  shell = vim.fn.has('unix') and vim.o.shell or 'pwsh',
  autochdir = true,
  start_in_insert = false,
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local bacon = Terminal:new({ cmd = "bacon", hidden = true, direction = "vertical", size = 45 })

function _lazygit_toggle() lazygit:toggle() end
function _bacon_toggle() bacon:toggle() end

nnoremap("gt", "<cmd>ToggleTerm<CR>")
nnoremap("<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
nnoremap("<leader>bc", "<cmd>lua _bacon_toggle()<CR>")

-- trouble
