-- https://github.com/numToStr/Navigator.nvim
return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup()
    require("user.keymaps").navigator_keymaps()
  end
}
