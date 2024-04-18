-- https://github.com/letieu/wezterm-move.nvim
return {
  "letieu/wezterm-move.nvim",
  enabled = true,
  config = function()
    local wm = require("wezterm-move")
    require("user.keymaps").wezterm_move_keymaps(wm)
  end,
}
