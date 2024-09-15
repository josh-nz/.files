-- https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  enabled = false,
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  ---@type Flash.Config
  opts = {},
}

-- Here are a bunch of similar alternatives:

-- f F t T etc assistants
-- https://github.com/unblevable/quick-scope
-- https://github.com/jinh0/eyeliner.nvim
--
-- https://github.com/ggandor/leap.nvim
-- https://github.com/rasulomaroff/telepath.nvim  -- Treesitter text object motions for Leap
-- https://github.com/ggandor/flit.nvim -- quick-scope like for Leap
--
-- https://github.com/woosaaahh/sj.nvim
-- https://github.com/backdround/improved-ft.nvim
--
-- https://github.com/smoka7/hop.nvim
