-- Some example workflows described here:
-- https://www.reddit.com/r/neovim/comments/113ewaf/fzflua_quickstart_its_never_been_easier_to_try/

-- https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  enabled = true,
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- calling `setup` is optional for customization
    local fzflua = require("fzf-lua")
    local rg_opts_default = fzflua.config.defaults.grep.rg_opts

    fzflua.setup({
      -- utilizes fzf's native previewing ability in the terminal where
      -- possible using bat for previews
      "fzf-native",
      -- fzf_colors = {
      --   ["fg"]          = { "fg", "CursorLine" },
      --   ["bg"]          = { "bg", "Normal" },
      --   ["hl"]          = "underline", --= { "fg", "Comment" },
      --   ["fg+"]         = { "fg", "Normal" },
      --   ["bg+"]         = { "bg", "CursorLine" },
      --   ["hl+"]         = "underline", --{ "fg", "Statement" },
      --   ["info"]        = { "fg", "PreProc" },
      --   ["prompt"]      = { "fg", "Conditional" },
      --   ["pointer"]     = { "fg", "Exception" },
      --   ["marker"]      = { "fg", "Keyword" },
      --   ["spinner"]     = { "fg", "Label" },
      --   ["header"]      = { "fg", "Comment" },
      --   ["gutter"]      = { "bg", "Normal" },
      -- },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept", -- Send all items to quickfix list.
        },
      },
      previewers = {
        bat = { theme = "Catppuccin Mocha" },
      },
      files = {
        formatter = "path.filename_first",
      },
      grep = {
        rg_opts = "--hidden " .. rg_opts_default,
      },
    })

    require("user.keymaps").fzflua_keymaps()
  end,
}
