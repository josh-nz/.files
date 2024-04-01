-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      multiline = false,
    },
  },
}
