-- https://github.com/kungfusheep/mfd.nvim
return {
  "kungfusheep/mfd.nvim",
  enabled = false,
  lazy = true,
  priority = 1000,
  config = function()
    require("mfd").setup({
      bright_comments = true,
    })
  end,
}
