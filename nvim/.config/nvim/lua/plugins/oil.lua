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
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you still want to use netrw.
      default_file_explorer = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-\\>"] = "actions.select_vsplit", -- Default is <C-s>
        -- This is used to navigate left
        ["<C-enter>"] = "actions.select_split", -- Default is <C-h>
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh", -- Default is <C-l>
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        -- This one has been removed
        -- ["g\\"] = "actions.toggle_trash", 
      },
      use_default_keymaps = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
  end,
}