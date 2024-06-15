-- https://github.com/nvim-pack/nvim-spectre

-- MacOS may need to run brew install gnu-sed
return {
  "nvim-pack/nvim-spectre",
  enabled = false,
  lazy = true,
  cmd = { "Spectre" },  -- Lazy load on this command.
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "catppuccin/nvim",
  },
  config = function()
    -- local theme = require("catppuccin.palettes").get_palette("macchiato")

    -- vim.api.nvim_set_hl(0, "SpectreSearch", { bg = theme.red, fg = theme.base })
    -- vim.api.nvim_set_hl(0, "SpectreReplace", { bg = theme.green, fg = theme.base })

    require("spectre").setup({
      -- highlight = {
      --   search = "SpectreSearch",
      --   replace = "SpectreReplace",
      -- },
      -- mapping = {
      --   ["send_to_qf"] = {
      --     map = "<C-q>",
      --     cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
      --     desc = "Send all items to quickfix",
      --   },
      -- },
    })

    vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre"
    })

    vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
    })

    vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word"
    })

    vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
    })
  end,
}