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
    require("fzf-lua").setup({})
  end,
}
