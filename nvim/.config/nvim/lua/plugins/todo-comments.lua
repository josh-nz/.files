-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  -- enabled = false,
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      multiline = false,
    },
  },
}
