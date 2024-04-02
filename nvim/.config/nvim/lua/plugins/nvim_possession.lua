-- https://github.com/gennaro-tedesco/nvim-possession
return {
  "gennaro-tedesco/nvim-possession",
  enabled = false,
  dependencies = {
    -- https://github.com/ibhagwan/fzf-lua
    "ibhagwan/fzf-lua",
  },
  config = function()
    local possession = require("nvim-possession")
    possession.setup({
      autoload = true,
      save_hook = function()
        vim.cmd.Neotree("close")
        -- -- Get visible buffers
        -- local visible_buffers = {}
        -- for _, win in ipairs(vim.api.nvim_list_wins()) do
        --     visible_buffers[vim.api.nvim_win_get_buf(win)] = true
        -- end

        -- local buflist = vim.api.nvim_list_bufs()
        -- for _, bufnr in ipairs(buflist) do
        --     if visible_buffers[bufnr] == nil then -- Delete buffer if not visible
        --         vim.cmd("bd " .. bufnr)
        --     end
        -- end
      end,
      fzf_winopts = {
        width = 0.6,
      },
    })

    vim.api.nvim_create_user_command(
      "PosessionList",
      "lua require('nvim-possession').list()",
      {
        desc = "Possession: Lists sessions",
        force = false, -- Don't overwrite an existing command of the same name.
      }
    )

    vim.api.nvim_create_user_command(
      "PosessionNew",
      "lua require('nvim-possession').new()",
      {
        desc = "Possession: Create new session",
        force = false, -- Don't overwrite an existing command of the same name.
      }
    )
    vim.api.nvim_create_user_command(
      "PosessionUpdate",
      "lua require('nvim-possession').update()",
      {
        desc = "Possession: Updates current session",
        force = false, -- Don't overwrite an existing command of the same name.
      }
    )
    vim.api.nvim_create_user_command(
      "PosessionDelete",
      "lua require('nvim-possession').delete()",
      {
        desc = "Possession: Deletes current session",
        force = false, -- Don't overwrite an existing command of the same name.
      }
    )
  end,
}
