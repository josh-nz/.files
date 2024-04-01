-- https://github.com/numToStr/FTerm.nvim
return {
  "numToStr/FTerm.nvim",
  enabled = true,
  config = function()
    -- require("FTerm").setup()
    vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
