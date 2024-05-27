-- https://github.com/vague2k/huez.nvim
return {
  "vague2k/huez.nvim",
  enabled = false,
  -- if you want registry related features, uncomment this
  import = "huez-manager.import",
  config = function()
      require("huez").setup({})
  end,
}
