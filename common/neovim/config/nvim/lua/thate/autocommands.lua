local uv = vim.loop
local map = require("thate.utils").map
local config_group = vim.api.nvim_create_augroup('thate', {})

local function set_sessions(sessions)
  local path = vim.fn.stdpath('cache') .. '/dashboard/cache'
  uv.fs_open(path, 'w', 438, function(err, fd)
    local dump = 'return ' .. vim.inspect(sessions)
    assert(not err, err)
    uv.fs_write(fd, dump, function(err, _)
      assert(not err, err)
      uv.fs_close(fd)
    end)
  end)
end

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionSavePost",
  group = config_group,
  callback = function()
      -- update dashboard
      local sessions = require("session_manager.utils").get_sessions()
      -- sort sessions early first
      table.sort(sessions, function (a, b) return a.timestamp < b.timestamp end)
      -- list session names
      set_sessions(map(sessions, function (session) return session.dir.filename end))
  end,
})
