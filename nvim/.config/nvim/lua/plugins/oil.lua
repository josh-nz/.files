-- https://github.com/stevearc/oil.nvim

-- colorcolumn option not currently enabled in vim-config.lua
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "oil",
-- 	callback = function()
-- 		vim.opt_local.colorcolumn = ""
-- 	end,
-- })

return {
  "stevearc/oil.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you still want to use netrw.
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-\\>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" }, -- Default is <C-s>
        ["<C-enter>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" }, -- Default is <C-h>
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in a horizontal split" },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh", -- Default is <C-l>
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      use_default_keymaps = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git" or name == ".DS_Store"
        end,
      },
    })

    require("user.keymaps").oil_keymaps()
  end,
}
