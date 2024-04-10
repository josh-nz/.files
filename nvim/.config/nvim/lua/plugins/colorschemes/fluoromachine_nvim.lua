-- https://github.com/Shatur/neovim-ayu
return {
  "maxmx03/fluoromachine.nvim",
  enabled = true,
	lazy = false,
	priority = 1000,
  config = function()
    require("fluoromachine").setup({
      glow = true,
      theme = "fluoromachine",
    })
  end,
}
