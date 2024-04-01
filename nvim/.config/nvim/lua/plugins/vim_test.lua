-- https://github.com/vim-test/vim-test
return {
  "vim-test/vim-test",
  enabled = true,
  dependencies = {
    -- https://github.com/preservim/vimux
    "preservim/vimux",
  },
  config = function()
    require("user.keymaps").vim_test_keymaps()
    vim.cmd("let test#strategy = 'vimux'")
    vim.cmd("let g:test#preserve_screen = 1")

    vim.g.VimuxUseNearest = false
  end,
}
