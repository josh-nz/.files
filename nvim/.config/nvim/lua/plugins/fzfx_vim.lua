-- https://github.com/linrongbin16/fzfx.nvim
return {
  "linrongbin16/fzfx.nvim",
  enabled = true,
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
    -- https://github.com/junegunn/fzf
    "junegunn/fzf"
  },

  -- specify version to avoid break changes
  version = "v5.*",

  config = function()
    require("fzfx").setup()
  end,
}
