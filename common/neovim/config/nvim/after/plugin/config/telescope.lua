require("telescope").setup({
  extensions = {
    coc = {
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
