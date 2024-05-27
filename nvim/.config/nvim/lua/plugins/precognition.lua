-- https://github.com/tris203/precognition.nvim
return {
  "tris203/precognition.nvim",
  enabled = true,
  -- Some sort of lazy loading is needed here, otherwise the custom highlightColor
  -- doesn't take effect. Unsure exactly why, see my discussion here:
  -- https://github.com/tris203/precognition.nvim/pull/31
  event = "VeryLazy",
  config = {
    -- startVisible = true,
    -- showBlankVirtLine = true,
    -- highlightColor = { link = "Comment" },
    highlightColor = {
      fg = "yellow",
      underline = true
    },
    -- hints = {
    --      Caret = { text = "^", prio = 2 },
    --      Dollar = { text = "$", prio = 1 },
    --      MatchingPair = { text = "%", prio = 5 },
    --      Zero = { text = "0", prio = 1 },
    --      w = { text = "w", prio = 10 },
    --      b = { text = "b", prio = 9 },
    --      e = { text = "e", prio = 8 },
    --      W = { text = "W", prio = 7 },
    --      B = { text = "B", prio = 6 },
    --      E = { text = "E", prio = 5 },
    -- },
    -- gutterHints = {
    --     -- prio is not currently used for gutter hints
    --     G = { text = "G", prio = 1 },
    --     gg = { text = "gg", prio = 1 },
    --     PrevParagraph = { text = "{", prio = 1 },
    --     NextParagraph = { text = "}", prio = 1 },
    -- },
  },
  -- keys = {
  --   {
  --     "<leader>k",
  --     function()
  --       require("precognition").toggle()
  --     end
  --   }
  -- },
}
