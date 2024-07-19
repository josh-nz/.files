-- https://github.com/unblevable/quick-scope
return {
  "unblevable/quick-scope",
  enabled = true,
  init = function()
    vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
  end,
}
