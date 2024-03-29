-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    -- https://github.com/nvim-telescope/telescope-ui-select.nvim
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          -- https://github.com/nvim-telescope/telescope.nvim/blob/0.1.x/lua/telescope/mappings.lua
          -- The below are unchanged from the above link unless noted otherwise.
          i = {
            ["<C-n>"] = actions.move_selection_next,  -- Maybe map to <C-k> ?
            ["<C-p>"] = actions.move_selection_previous,  -- Maybe map to <C-j> ?

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-s>"] = actions.select_horizontal,  -- Default was <C-x>
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,  -- Maybe map to <C-q> ?
            ["<C-l>"] = actions.complete_tag,
            ["<C-/>"] = actions.which_key,
            ["<C-_>"] = actions.which_key, -- Source comment: keys from pressing <C-/>
            ["<C-w>"] = { "<c-s-w>", type = "command" },

            -- Source comment: disable c-j because we dont want to allow new lines #2123
            ["<C-j>"] = actions.nop,

            -- These need to be added, not part of the defaults:
            -- ["<C-Down>"] = actions.cycle_history_next,
            -- ["<C-Up>"] = actions.cycle_history_prev,
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            -- Source comment: TODO: This would be weird if we switch the ordering.
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
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

    telescope.load_extension("fzf")
    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    telescope.load_extension("ui-select")

    local builtin = require("telescope.builtin")
    require("user.keymaps").telescope_keymaps(builtin)
  end,
}
