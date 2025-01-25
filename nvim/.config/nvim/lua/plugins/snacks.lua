-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
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
    picker = { enabled = true },
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
        -- zero is full width/height.
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
