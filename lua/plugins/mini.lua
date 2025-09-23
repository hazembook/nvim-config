return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      local statusline = require('mini.statusline')
      local pairs = require("mini.pairs")
      statusline.setup { use_icons = true }
      pairs.setup {}
    end
  },
}
