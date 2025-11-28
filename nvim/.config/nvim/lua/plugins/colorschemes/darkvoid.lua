-- https://github.com/aliqyan-21/darkvoid.nvim
return {
  "aliqyan-21/darkvoid.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
    glow = true,
    show_end_of_buffer = true,  -- Show ~ in numline.

    colors = {
      comment = "#66b2b2",
      -- line_nr = "#c0c0c0",
      line_nr = "#585858",
      search_highlight = "#bedc74",
      type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
    },
  },
}
