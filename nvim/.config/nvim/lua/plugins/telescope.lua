-- https://github.com/nvim-telescope/telescope.nvim
local telescope = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-x>"] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        -- find_files calls `rg --files --colour` as priority, see link for details.
        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/__files.lua#L272
        find_files = {
          -- Sets --hidden flag on ripgrep to show files starting with a `.`. 
          -- As a result, this causes it to now find files in .git folders.
          -- To prevent this, a .ignore file should be created that specifies
          -- to ignore `.git/`
          hidden = true,
        }
        },
        -- :help telescope.defaults.vimgrep_arguments
        -- will show the default arguments passed to ripgrep.
        live_grep = {
          additional_args = {
            "--hidden",
          },
        },
        -- :help telescope.defaults.vimgrep_arguments
        -- will show the default arguments passed to ripgrep.
        grep_string = {
          additional_args = {
            "--hidden",
          },
        },
      },
    })

    local builtin = require("telescope.builtin")
    -- find_files calls `rg --files --colour` as priority, see link for details.
    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/__files.lua#L272
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    -- :help telescope.defaults.vimgrep_arguments
    -- will show the default arguments passed to ripgrep.
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    require("telescope").load_extension("fzf")
  end,
}

-- https://github.com/nvim-telescope/telescope-ui-select.nvim
local telescope_ui_select = {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            -- even more opts
          }),

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        },
      },
    })
    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require("telescope").load_extension("ui-select")
  end,
}

return {
  telescope,
  telescope_ui_select,
}
