-- toc 
--   airline
--   bufferline
--   neotree
--   scrollbar
--   toggleterm
--   trouble

-- airline
vim.g.airline_theme = 'onedark'
vim.g.airline_powerline_fonts = 1

-- bufferline
require("bufferline").setup{
  options = {
    offsets = {{filetype = "neo-tree", text = "File Explorer", text_align = "center", padding = 1}},
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
  direction = 'tab',
  shell = vim.fn.has('unix') and vim.o.shell or 'pwsh',
}

-- trouble
