-- https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  enabled = false,
  event = { "BufEnter" },
  -- lazy = true,
  -- Not needed since Comment.nvim supports TreeSitter?
  -- Probably only needed for TSX/JSX since that's not
  -- supported by Comment.nvim natively?
  -- dependencies = {
  --   {
  --     -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  --     "JoosepAlviste/nvim-ts-context-commentstring",
  --     opts = { enable_autocmd = false },
  --   },
  -- },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("Comment").setup({
      -- Don't comment blank lines.
      ignore = "^$",
      -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
