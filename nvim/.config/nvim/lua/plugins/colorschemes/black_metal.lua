-- https://github.com/metalelf0/black-metal-theme-neovim
return {
  "metalelf0/black-metal-theme-neovim",
  enabled = true,
  lazy = true,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      -- optional configuration here
    })
  end,
}
