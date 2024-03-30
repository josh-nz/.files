-- https://github.com/mrjones2014/smart-splits.nvim
return {
  "mrjones2014/smart-splits.nvim",
  enabled = false,
  lazy = false,
  config = function()
    local ss = require("smart-splits")
    ss.setup({
      disable_multiplexer_nav_when_zoomed = false,
    })

    require("user.keymaps").smart_splits_keymaps(ss)
  end
}
