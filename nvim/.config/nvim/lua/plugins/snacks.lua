-- https://github.com/folke/snacks.nvim


-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
local picker_config = {
  enabled = true,
  win = {
    -- input window
    input = {
      keys = {
        ["<Esc>"] = "close",
        ["<C-c>"] = { "close", mode = "i" },
        -- to close the picker on ESC instead of going to normal mode,
        -- add the following keymap to your config
        -- ["<Esc>"] = { "close", mode = { "n", "i" } },
        ["<CR>"] = { "confirm", mode = { "n", "i" } },
        ["G"] = "list_bottom",
        ["gg"] = "list_top",
        ["j"] = "list_down",
        ["k"] = "list_up",
        ["/"] = "toggle_focus",
        ["q"] = "close",
        ["?"] = "toggle_help",
        ["<a-d>"] = { "inspect", mode = { "n", "i" } },
        ["<c-a>"] = { "select_all", mode = { "n", "i" } },
        ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
        ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
        ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
        ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
        ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
        ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
        ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
        ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
        ["<Down>"] = { "list_down", mode = { "i", "n" } },
        ["<Up>"] = { "list_up", mode = { "i", "n" } },
        ["<c-j>"] = { "list_down", mode = { "i", "n" } },
        ["<c-k>"] = { "list_up", mode = { "i", "n" } },
        ["<c-n>"] = { "list_down", mode = { "i", "n" } },
        ["<c-p>"] = { "list_up", mode = { "i", "n" } },
        ["<c-l>"] = { "preview_scroll_left", mode = { "i", "n" } },
        ["<c-h>"] = { "preview_scroll_right", mode = { "i", "n" } },
        ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
        ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
        ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
        ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
        ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
        ["<ScrollWheelDown>"] = { "list_scroll_wheel_down", mode = { "i", "n" } },
        ["<ScrollWheelUp>"] = { "list_scroll_wheel_up", mode = { "i", "n" } },
        ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
        ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
        ["<c-q>"] = { "qflist", mode = { "i", "n" } },
        ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
        ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
        ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
      },
    },
    -- result list window
    list = {
      keys = {
        ["<CR>"] = "confirm",
        ["gg"] = "list_top",
        ["G"] = "list_bottom",
        ["i"] = "focus_input",
        ["j"] = "list_down",
        ["k"] = "list_up",
        ["q"] = "close",
        ["<Tab>"] = "select_and_next",
        ["<S-Tab>"] = "select_and_prev",
        ["<Down>"] = "list_down",
        ["<Up>"] = "list_up",
        ["<a-d>"] = "inspect",
        ["<c-d>"] = "list_scroll_down",
        ["<c-u>"] = "list_scroll_up",
        ["zt"] = "list_scroll_top",
        ["zb"] = "list_scroll_bottom",
        ["zz"] = "list_scroll_center",
        ["/"] = "toggle_focus",
        ["<ScrollWheelDown>"] = "list_scroll_wheel_down",
        ["<ScrollWheelUp>"] = "list_scroll_wheel_up",
        ["<c-a>"] = "select_all",
        ["<c-f>"] = "preview_scroll_down",
        ["<c-b>"] = "preview_scroll_up",
        ["<c-l>"] = "preview_scroll_right",
        ["<c-h>"] = "preview_scroll_left",
        ["<c-v>"] = "edit_vsplit",
        ["<c-s>"] = "edit_split",
        ["<c-j>"] = "list_down",
        ["<c-k>"] = "list_up",
        ["<c-n>"] = "list_down",
        ["<c-p>"] = "list_up",
        ["<a-w>"] = "cycle_win",
        ["<Esc>"] = "close",
      },
    },
    -- preview window
    preview = {
      keys = {
        ["<Esc>"] = "close",
        ["q"] = "close",
        ["i"] = "focus_input",
        ["<ScrollWheelDown>"] = "list_scroll_wheel_down",
        ["<ScrollWheelUp>"] = "list_scroll_wheel_up",
        ["<a-w>"] = "cycle_win",
      },
    },
  },
}






return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  import = "plugins.snacks",
  opts = {
    -- Deal with big files
    bigfile = { enabled = true },
    -- Delete buffers without disrupting window layout
    bufdelete = { enabled = true },
    -- Beautiful declarative dashboards
    dashboard = { enabled = false },
    -- Focus on the active scope by dimming the rest
    dim = { enabled = false },
    -- Git utilities
    git = { enabled = true },
    -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)
    gitbrowse = { enabled = true },
    -- Indent guides and scopes
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
    },
    -- Better vim.ui.input
    input = { enabled = false },
    -- Window layouts
    layout = { enabled = false },
    -- Open LazyGit in a float, auto-configure colorscheme and integration with Neovim
    lazygit = { enabled = true },
    -- Pretty vim.notify
    notifier = { enabled = false },
    -- Picker for selecting items
    picker = picker_config,
    -- Neovim lua profiler
    profiler = { enabled = false },
    -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
    quickfile = { enabled = true },
    -- LSP-integrated file renaming with support for plugins like neo-tree.nvim and mini.files.
    rename = { enabled = false },
    -- Scope detection, text objects and jumping based on treesitter or indent
    scope = { enabled = true },
    -- Scratch buffers with a persistent file
    scratch = { enabled = false },
    -- Smooth scrolling
    scroll = { enabled = false },
    -- Pretty status column
    statuscolumn = { enabled = false },
    -- Create and toggle floating/split terminals
    terminal = { enabled = true },
    -- Toggle keymaps, integrated with which-key icons / colors
    toggle = { enabled = true },
    -- Create and manage floating windows or splits
    win = { enabled = false },
    -- Auto-show LSP references and quickly navigate between them
    words = { enabled = true },
    -- Zen mode • distraction-free coding
    zen = { enabled = false },
    styles = {
      lazygit = {
        -- Zero is full width/height
        height = 0,
        width = 0,
      },
    },
  },
  keys = require("user.keymaps").snacks(),
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        require("user.keymaps").snacks_toggles()
      end,
    })
  end,
}
