-- Strange highlight color out of the box, hidden files now shown by default
-- so requires some messing around with.

-- https://github.com/vijaymarupudi/nvim-fzf-commands
return {
  "vijaymarupudi/nvim-fzf-commands",
  enabled = false,
  dependencies = {
    -- https://github.com/vijaymarupudi/nvim-fzf
    "vijaymarupudi/nvim-fzf",
  },
}
