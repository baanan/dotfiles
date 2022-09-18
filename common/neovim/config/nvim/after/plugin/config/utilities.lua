-- toc
--   aerial
--   fugitive
--   session_manager

-- session_manager
require('session_manager').setup({
  -- autosave_ignore_not_normal = false,
  autosave_ignore_filetypes = {
    'gitcommit',
    'toggleterm',
  },
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
})

-- fugitive
--     automatically update git repos
if vim.api.nvim_eval('!empty(FugitiveGitDir())') == 1 then
  vim.api.nvim_command('G pull')
end

-- aerial
require('aerial').setup({})
