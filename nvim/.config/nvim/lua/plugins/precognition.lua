-- https://github.com/tris203/precognition.nvim
return {
  "tris203/precognition.nvim",
  enabled = false,
  -- Some sort of lazy loading is needed here, otherwise the custom highlightColor
  -- doesn't take effect. Unsure exactly why, see my discussion here:
  -- https://github.com/tris203/precognition.nvim/pull/31
  event = "VeryLazy",
  opts = {
    startVisible = true,
    -- virtLinePosition = "dynamic-inverted",
    showBlankVirtLine = true,
    -- highlightColor = { link = "Comment" },
    highlightColor = {
      fg = "yellow",
      -- underline = true
    },
    hints = {
      Caret = { text = "^", prio = 0 }, -- Originally prio 2
      Dollar = { text = "$", prio = 0 }, -- Originally prio 1
      MatchingPair = { text = "%", prio = 5 },
      Zero = { text = "0", prio = 0 }, -- Originally prio 1
      w = { text = "w", prio = 10 },
      b = { text = "b", prio = 9 },
      e = { text = "e", prio = 8 },
      W = { text = "W", prio = 7 },
      B = { text = "B", prio = 6 },
      E = { text = "E", prio = 5 },
    },
    gutterHints = {
      -- prio is not currently used for gutter hints
      G = { text = "G", prio = 10 }, -- Originally prio 10
      gg = { text = "gg", prio = 9 }, -- Originally prio 9
      PrevParagraph = { text = "{", prio = 8 },
      NextParagraph = { text = "}", prio = 8 },
    },
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
