-- https://github.com/EL-MASTOR/bufferlist.nvim
return {
  "EL-MASTOR/bufferlist.nvim",
  enabled = false,
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "BufferList",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = { { "<Leader>b", ':BufferList<CR>', desc = "Open bufferlist" } },
}
