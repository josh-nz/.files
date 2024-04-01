-- https://github.com/arp242/undofile_warn.vim
return {
  "arp242/undofile_warn.vim",
  enabled = true,
  lazy = false,
  init = function()
    vim.g.undofile_warn_mode = 2
  end
}
