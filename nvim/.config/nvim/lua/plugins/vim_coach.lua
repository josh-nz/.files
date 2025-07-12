-- https://github.com/shahshlok/vim-coach.nvim
return {
  "shahshlok/vim-coach.nvim",
  enabled = true,
  dependencies = {
    "folke/snacks.nvim",
  },
  init = function()
    vim.g.vim_coach_no_default_keymaps = 1
  end,
  keys = require("user.keymaps").vim_coach_keymaps(),
}

