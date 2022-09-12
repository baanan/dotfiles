-- toc
--   session_manager
--   aerial

-- aerial
require('aerial').setup({})

-- session_manager
require('session_manager').setup({
  autosave_ignore_not_normal = false,
  autosave_ignore_filetypes = {
    'gitcommit',
    'toggleterm',
  },
})
