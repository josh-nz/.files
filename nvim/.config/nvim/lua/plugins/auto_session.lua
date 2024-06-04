-- https://github.com/rmagatti/auto-session
return {
  "rmagatti/auto-session",
  enabled = false,
  config = function()
---@diagnostic disable-next-line: missing-fields
    require("auto-session").setup({
      -- log_level = "debug",
      auto_session_allowed_dirs = {
        "~/.files",
        "~/code/elixir/*",
        "~/code/elixir/little_elixir_otp_guide/*",
        "~/code/phoenix/*",
      },
      auto_session_use_git_branch = true,
      pre_save_cmds = {
        -- If Neotree is saved in a session, there is a duplicate buffer error when
        -- you try to show Neotree after restoring a session, and Neotree remains wonky
        -- until it's removed from the session. So close Neotree before a session is saved.
        "Neotree close",
      },
    })
  end,
}
