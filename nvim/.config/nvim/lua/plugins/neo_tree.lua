-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          -- visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
          },
        },
        -- Don't change nvim's cwd if the NeoTree root changes.
        bind_to_cwd = false,
        use_libuv_file_watcher = true
      },
      buffers = {
        -- When using sessions, restored buffers start unloaded until focused.
        -- Set this to true so they still show in the buffer tree. 
        show_unloaded = true,
      },
      source_selector = {
        winbar = true,
      },
    })

    require("user.keymaps").neo_tree_keymaps()

    -- More configuration and integration ideas here:
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
  end,
}
