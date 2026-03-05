-- Original version, not async so slower (in theory, untested)

-- https://github.com/junegunn/fzf.vim
return {
  "junegunn/fzf.vim",
  enabled = false,
  dependencies = {
    -- https://github.com/junegunn/fzf
    "junegunn/fzf"
  },
  init = function()
    -- Requires that the fzf binary is already installed using Homebrew.
    vim.o.rtp = vim.o.rtp .. "," .. "/usr/local/opt/fzf"
  end,
}
