-- https://github.com/jedrzejboczar/possession.nvim
return {
  "jedrzejboczar/possession.nvim",
  enabled = true,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- https://github.com/ibhagwan/fzf-lua
    -- "ibhagwan/fzf-lua",
  },
  config = function()
    local possession = require("possession")
    possession.setup({
      -- debug = true,
      -- logfile = true,
      prompt_no_cr = false,
      autosave = {
        current = true,
        cwd = function()
          -- Autosave if somewhere within a Git repo.
          for name, type in vim.fs.dir(vim.fn.getcwd()) do
            if name == ".git" and type == "directory" then
              local s = require("possession.session")
              local p = require("possession.paths")
              -- This `cwd` function is called while saving on quit
              -- only if there is no current session. This happens when
              -- session autoload is prevented (eg file args passed to 
              -- Neovim), or a session is closed. In these cases, we don't
              -- want to autosave the `cwd` session if it already exists,
              -- since it was never loaded and would therefore be overwritten.
              -- https://github.com/jedrzejboczar/possession.nvim/issues/72
              return not s.exists(p.cwd_session_name())
            end
          end
          return false
        end,
        tmp = false,
        tmp_name = "tmp",
        on_load = true,
        on_quit = true,
      },
      autoload = "last_cwd",
      plugins = {
        close_windows = {
          hooks = {'before_save', 'before_load'},
          preserve_layout = true,  -- or fun(win): boolean
          match = {
            floating = true,
            buftype = {},
            filetype = {},
            custom = false,  -- or fun(win): boolean
          },
        },
        -- We want to save hidden buffers to session, so prevent them from 
        -- being deleted before the session is saved.
        delete_hidden_buffers = false,
        -- delete_hidden_buffers = {
        --   hooks = {
        --     'before_load',
        --     vim.o.sessionoptions:match('buffer') and 'before_save',
        --   },
        --   force = false,  -- or fun(buf): boolean
        -- },
        nvim_tree = true,
        neo_tree = true,
        symbols_outline = true,
        tabby = true,
        dap = true,
        dapui = true,
        neotest = true,
        -- Forcefully delete all buffers before loading a session.
        delete_buffers = true,
        -- delete_buffers = false,
        stop_lsp_clients = true,
      },
      telescope = {
        previewer = {
          enabled = false,
          previewer = "pretty", -- or "raw" or fun(opts): Previewer
          wrap_lines = true,
          include_empty_plugin_data = false,
          cwd_colors = {
            cwd = "Comment",
            tab_cwd = { "#cc241d", "#b16286", "#d79921", "#689d6a", "#d65d0e", "#458588" }
          }
        },
        list = {
          default_action = "load",
          mappings = {
            save = { n = "<C-s>", i = "<C-s>" },
            load = { n = "<C-v>", i = "<C-v>" },
            delete = { n = "<C-x>", i = "<C-x>" },
            rename = { n = "<C-r>", i = "<C-r>" },
          },
        },
      },
    })
  end,
}
