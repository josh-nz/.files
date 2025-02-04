-- https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    -- highlight = {
    --   multiline = false,
    --   -- vimgrep regex, supporting the pattern TODO(name):
    --   pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
    -- },
    -- search = {
    --   -- ripgrep regex, supporting the pattern TODO(name):
    --   pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
    -- }
  },
}
