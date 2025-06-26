-- https://github.com/nvim-treesitter/nvim-treesitter
-- Good video explaining this at https://www.youtube.com/watch?v=kYXcxJxJVxQ
return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  lazy = false,
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- Good videos explaining this at https://www.youtube.com/watch?v=ff0GYrK3nT0
    -- and at https://www.youtube.com/watch?v=FuYQ7M73bC0
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    -- This pins the current scope to top of file
    -- "nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  config = function()
---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- There parsers are bundled with NeoVim. We must install them via Treesitter
        -- so that we have the correct versions for the Treesitter queries. Refer:
        -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
        "c",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        -- Might need to install the `query` language if :checkhealth reports a query error. Refer to link above.
        -- "query",

        -- Other parsers I've chosen to install:
        "elixir",
        "heex",
        "eex",
        "gleam",
        "javascript",
        "json",
        "typescript",
        "html",
        "comment",
        -- Requrired for Snacks plugin:
        "regex",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        -- If you are experiencing weird indenting issues, add the language to
        -- the list of additional_vim_regex_highlighting and disabled languages for indent.
        -- :h 'indentexpr'
        -- :verbose set indentexpr?
        additional_vim_regex_highlighting = { "ruby", "elixir" },
      },
      indent = {
        enable = true,
        disable = { "ruby", "elixir" },
      },
      autopairs = { enable = false },

      incremental_selection = {
        enable = false,
        keymaps = {
          -- Set to `false` to disable one of the mappings
          init_selection = "<C-space>", -- default gnn
          node_incremental = "<C-space>", -- default grn
          scope_incremental = "<C-s>",  --default grc
          node_decremental = "<C-backspace>", --default grm
        },
      },

      -- The following modules are provided by "nvim-treesitter/nvim-treesitter-textobjects" dependency.
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      -- Good videos explaining this at https://www.youtube.com/watch?v=ff0GYrK3nT0
      -- and at https://www.youtube.com/watch?v=FuYQ7M73bC0
      textobjects = {
        select = {
          enable = false,
          lookahead = true, -- Automatically jump forward to textobj; behaves like NeoVim textobj defaults.
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },

            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },

        -- You can choose the select mode (default is charwise 'v')
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },

        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in `ap`.

        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = true,

        -- Define your own mappings to swap the node under the cursor with
        -- the next or previous one, like function parameters or arguments.
        swap = {
          enable = false,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },

        -- Define your own mappings to jump to the next or previous text object.
        -- This is similar to ]m, [m, ]M, [M Neovim's mappings to jump to the 
        -- next or previous function.
        move = {
          enable = false,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
            ["]o"] = "@loop.*",
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            ["]d"] = "@conditional.outer",
          },
          goto_previous = {
            ["[d"] = "@conditional.outer",
          },
        },

        -- peek_definition_code: show textobject surrounding definition as determined 
        -- using Neovim's built-in LSP in a floating window. Press the shortcut 
        -- twice to enter the floating window.
        lsp_interop = {
          enable = false,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
    })
  end,
}
