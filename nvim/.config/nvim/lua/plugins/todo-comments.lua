-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    highlight = {
      multiline = false,
    },
  },
}
