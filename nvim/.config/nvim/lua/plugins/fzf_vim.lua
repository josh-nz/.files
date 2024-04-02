-- https://github.com/junegunn/fzf.vim
return {
  "junegunn/fzf.vim",
  enabled = true,
  dependencies = {
    -- https://github.com/junegunn/fzf
    "junegunn/fzf"
  },
  init = function()
    -- Requires that the fzf binary is already installed using Homebrew.
    -- vim.cmd("set rtp+=/usr/local/opt/fzf")
    vim.opt.rtp:append("/usr/local/opt/fzf")
  end,
}
