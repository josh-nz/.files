-- https://github.com/paulshuker/textangle.nvim
return {
  "paulshuker/textangle.nvim",
  enabled = false,
  lazy = true,
  opts = {
    -- The maximum width of each line. When set to -1, Neovim's
    -- [textwidth](https://neovim.io/doc/user/options.html#'textwidth') is used. See the
    -- [editorconfig](https://neovim.io/doc/user/editorconfig.html) for ways to configure
    -- textwidth project-wise.
    line_width = -1,
    -- Repeat the indent found on the first line on every line.
    keep_indent = true,
    -- If the first given line contains one of these prefixes (after any optional
    -- indentation), then the prefix is repeated on every line. This is useful for
    -- single-line comments. Whitespace must match too. Set to { } to disable.
    keep_prefixes = { "-- ", "// ", "# " },
    -- Allow words to be hyphenated. A word will be hyphenated if placing the entire word
    -- on the next line leaves a whitespace greater than hyphenate_minimum_gap. The hyphen
    -- is placed at the end of lines.
    hyphenate = false,
    -- See hyphenate.
    hyphenate_minimum_gap = 10,
    -- If a word is longer than line_width, hyphenate it. If false, words longer than
    -- line_width will overflow.
    hyphenate_overflow = true,
    -- When disabled, textangle will silently do nothing whenever called.
    disable = false,
  },
  cmd = { "TextangleLine" },
  -- vim.api.nvim_set_keymap("n", "gl", "<cmd>TextangleLine<CR>", { noremap = true })
  -- vim.api.nvim_set_keymap(
    --   "x",
    --   "gk",
    --   "<cmd>lua require('textangle').format_visual_line()<CR>",
    --   { noremap = true }
    -- )
}
