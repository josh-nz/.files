-- https://github.com/NeogitOrg/neogit
return {
  "NeogitOrg/neogit",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    -- https://github.com/sindrets/diffview.nvim
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    -- https://github.com/nvim-telescope/telescope.nvim
    -- "nvim-telescope/telescope.nvim", -- optional
    -- https://github.com/ibhagwan/fzf-lua
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
}
