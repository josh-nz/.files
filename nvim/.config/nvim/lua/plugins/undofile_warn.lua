-- https://github.com/arp242/undofile_warn.vim
-- Alternative Lua version: https://github.com/mvllow/session-undo.nvim
return {
  "arp242/undofile_warn.vim",
  enabled = true,
  event = "BufEnter",
  init = function()
    vim.g.undofile_warn_mode = 2
  end
}
