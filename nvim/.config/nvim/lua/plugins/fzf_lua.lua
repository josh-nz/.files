-- Some example workflows described here:
-- https://www.reddit.com/r/neovim/comments/113ewaf/fzflua_quickstart_its_never_been_easier_to_try/

-- https://github.com/ibhagwan/fzf-lua
-- https://github.com/ibhagwan/fzf-lua/blob/main/OPTIONS.md
return {
  "ibhagwan/fzf-lua",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- calling `setup` is optional for customization
    local fzflua = require("fzf-lua")
    local files_rg_opts_default = fzflua.config.defaults.files.rg_opts
    local files_fd_opts_default = fzflua.config.defaults.files.fd_opts
    local grep_rg_opts_default = fzflua.config.defaults.grep.rg_opts

    fzflua.setup({
      -- utilizes fzf's native previewing ability in the terminal where
      -- possible using bat for previews
      -- "fzf-native",
      -- This profile allows the following auto colors option to work,
      -- since the preview is rendered by Neovim.
      -- `fzf-native` calls bat and will therefore use whatever colors
      -- bat is configured for, requiring a shell config change if the
      -- preview is to be consistent in color with Neovim, when changing
      -- the Neovim colorscheme.
      "default",  -- This profile allows the following option to work, fzf-native calls bat and will therefore use whatever bat is configured for
      defaults = {
        git_icons = false,
      },
      fzf_colors = true,  -- Auto generate colors based on colorscheme
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
      oldfiles = {
        -- https://www.reddit.com/r/neovim/comments/1hhiidm/a_few_nice_fzflua_configurations_now_that_lazyvim/
        -- In Telescope, when I used <leader>fr, it would load old buffers.
        -- fzf lua does the same, but by default buffers visited in the current
        -- session are not included. I use <leader>fr all the time to switch
        -- back to buffers I was just in. If you missed this from Telescope,
        -- give it a try.
        include_current_session = true,
      },
      previewers = {
        -- bat = { theme = "Catppuccin Mocha" },

        -- https://www.reddit.com/r/neovim/comments/1hhiidm/a_few_nice_fzflua_configurations_now_that_lazyvim/
        -- fzf-lua is very fast, but it really struggled to preview a couple files
        -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
        -- It turns out it was Treesitter having trouble parsing the files.
        -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
        -- (Yes, I know you shouldn't have 100KB minified files in source control.)
        syntax_limit_b = 1024 * 100, -- 100KB
      },
      files = {
        formatter = "path.filename_first",
        rg_opts = "--hidden " .. files_rg_opts_default, -- may want to add --follow which was also removed: https://github.com/ibhagwan/fzf-lua/commit/f95bb0ea1b45b1fb7d83cc5bf7b437f170ea4cbf#diff-5b07a3b3b4c05c2c95bf98379d9d3fcfbfc34306ca6c74796736a79d806c375b
        fd_opts = "--hidden " .. files_fd_opts_default, -- may want to add --follow which was also removed: https://github.com/ibhagwan/fzf-lua/commit/f95bb0ea1b45b1fb7d83cc5bf7b437f170ea4cbf#diff-5b07a3b3b4c05c2c95bf98379d9d3fcfbfc34306ca6c74796736a79d806c375b
        -- git_icons = true, -- changed to false in the commit https://github.com/ibhagwan/fzf-lua/commit/f95bb0ea1b45b1fb7d83cc5bf7b437f170ea4cbf#diff-5b07a3b3b4c05c2c95bf98379d9d3fcfbfc34306ca6c74796736a79d806c375b
      },
      grep = {
        rg_opts = "--hidden " .. grep_rg_opts_default,
      },
    })

    require("user.keymaps").fzflua_keymaps()
  end,
}
