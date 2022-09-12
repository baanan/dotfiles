-- toc 
--   bufresize
--   smart-splits

-- bufresize
require("bufresize").setup()

-- smart-splits
require('smart-splits').setup({
  resize_mode = {
    hooks = {
      on_leave = require('bufresize').register
    }
  }
})
