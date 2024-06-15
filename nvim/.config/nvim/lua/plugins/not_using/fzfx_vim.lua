-- This one was slower to display and slower to render preview than fzf_lua

-- https://github.com/linrongbin16/fzfx.nvim
return {
  "linrongbin16/fzfx.nvim",
  enabled = false,
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
    vim.g.fzfx_disable_buffer_previewer = 1
  end,
}
