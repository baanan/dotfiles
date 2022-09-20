require("telescope").setup({
  extensions = {
    coc = {
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('media_files')
