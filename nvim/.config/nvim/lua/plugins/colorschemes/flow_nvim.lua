-- https://github.com/0xstepit/flow.nvim
return {
  "0xstepit/flow.nvim",
  enabled = true,
  lazy = true,
	priority = 1000,
  config = function()
    require("flow").setup({
      transparent = false, -- Set transparent background.
      fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
      mode = "normal", -- Intensity of the palette: normal, dark, or bright. Notice that dark is ugly!
      aggressive_spell = false, -- Display colors for spell check.
    })
  end,
}
