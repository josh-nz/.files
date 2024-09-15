-- https://github.com/kdheepak/lazygit.nvim
return {
  "kdheepak/lazygit.nvim",
  enabled = true,
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  init = function()
    require("user.keymaps").lazygit_keymaps()
    vim.g.lazygit_floating_window_scaling_factor = 1.0 -- scaling factor for floating window
  end,
}
