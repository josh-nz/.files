-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- https://github.com/ThePrimeagen/harpoon
    -- "ThePrimeagen/harpoon",
  },
  event = "VeryLazy",
  config = function()
    -- Doesn't work with Harpoon 2 as API is very different.
    -- local harpoon = require("harpoon.list")

    -- local function harpoon_component()
    --  local total_marks = harpoon.get_length()

    --  if total_marks == 0 then
    --    return ""
    --  end

    --  local current_mark = "—"

    --  local mark_idx = harpoon.get_current_index()
    --  if mark_idx ~= nil then
    --    current_mark = tostring(mark_idx)
    --  end

    --  return string.format("󱡅 %s/%d", current_mark, total_marks)
    -- end


    local function session_name()
      -- return ""
      local _, name = pcall(require("possession.session").get_session_name)
      return name and "[" .. name .. "]" or ""
    end


    -- https://github.com/spacian/nvim/blob/lsp-zero/lua/plugins/lualine.lua
    local function diagnostic(level)
      if (vim.diagnostic.count(0)[level] or 0) > 0 then
        return "●"
      else
        -- return "◌"
        return "○"
      end
    end
    local function error_ind()
      return diagnostic(vim.diagnostic.severity.ERROR)
    end
    local function warn_ind()
      return diagnostic(vim.diagnostic.severity.WARN)
    end
    local function info_ind()
      return diagnostic(vim.diagnostic.severity.INFO)
    end
    local function hint_ind()
      return diagnostic(vim.diagnostic.severity.HINT)
    end
    local function diagnostic_color(hl_name)
      return string.format(
        "#%06X",
        vim.api.nvim_get_hl(0, { name = hl_name, link = false }).fg
          or vim.api.nvim_get_hl(0, { name = hl_name, link = false }).sp
      )
    end

    local diagnostics_ind = {
      error = {
        error_ind,
        color = { fg = diagnostic_color("DiagnosticError") },
      },
      warn = {
        warn_ind,
        color = { fg = diagnostic_color("DiagnosticWarn") },
      },
      info = {
        info_ind,
        color = { fg = diagnostic_color("DiagnosticInfo") },
      },
      hint = {
        hint_ind,
        color = { fg = diagnostic_color("DiagnosticHint") },
      },
    }



    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
          -- harpoon_component,
          "diff",
          "diagnostics",
        },
        lualine_c = {
          { "filename", path = 1, },
        },

        lualine_x = {
          -- "encoding",
          -- {
          --   "fileformat",
          --   symbols = {
          --     -- MacOS uses *nix file line endings, so we'll always see the
          --     -- Linux penguin in the status line. Override to Apple icon.
          --     unix = "",
          --   },
          -- },
          -- diagnostics_ind.error,
          -- diagnostics_ind.warn,
          -- diagnostics_ind.info,
          -- diagnostics_ind.hint,
          session_name,
          "filetype",
          "lsp_status",
          -- {
          --   require("minuet.lualine"),
          --   display_on_idle = true,
          -- },
        },
        lualine_y = {
          "progress", -- % through file indicator.
        },
        lualine_z = {
          -- "selectioncount",
          -- "searchcount",
          "location",  -- line and column number.
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1, } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },

      -- Tabline (aka bufferline) is a bar that goes across the whole of Vim,
      -- so is therefore not scoped to just a single window.
      tabline = {
        lualine_a = {
          {
            "buffers",
            -- show_filename_only = false,
            mode = 4,  -- 4 = buffer name + buffer number, 2 = buffer name + index
            -- use_mode_colours = true, -- Don't understand what this does.
            icons_enabled = false,
            symbols = {
              modified = " [+]",
              alternate_file = "#",
            },

            buffers_color = {
              active = "lualine_b_normal",
            },
            -- buffers_color = {
            --   -- :h attr-list for gui styles
            --   active = function(section)
            --     -- print("active")
            --     print(vim.inspect(section))
            --     if vim.bo.modified then
            --       return { gui = "italic,bold", bg = "grey" }

            --     else
            --       return { gui = "NONE", bg = "blue" }
            --     end
            --   end,
            --   inactive = function(section)
            --     -- print("inactive")
            --     print(vim.inspect(section))

            --     if vim.bo.modified then
            --       return { gui = "italic,bold", bg = "red" }
            --     else
            --       return { gui = "NONE", bg = "white" }
            --     end
            --   end,

            --   -- BufferLineModifiedSelected
            --   -- BufferLineModifiedVisible
            --   -- active = function(section)
            --   --    return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
            --   -- end,

            -- },
            -- color key doesn't seem to work for this component, need to use
            -- the buffers_color sub keys, which take the same data structure as color.
            -- color = { fg = "color_name(red)", bg = "grey", gui = "italic,bold" },
          },
        },
        -- lualine_b = { "branch" },
        -- lualine_c = { "filename" },
        -- lualine_x = {},
        -- lualine_y = {},
        lualine_z = {
          {
            "tabs",
            mode = 0,  -- 0 nbr, 1 name, 2 both
            path = 0,  -- 0 filename
            tabs_color = {
              active = "lualine_b_normal",
            },
            show_modified_status = true,
          },
          {
            "datetime",
            style = "%H:%M",
          },
        }
      },

      -- Appears to be a bar that sits just above the window but below
      -- the Tabline, scoped to current window only.
      -- This property appears to be written to the session, so if
      -- playing with this setting, note that the winbar might 
      -- persist even after disabling the winbar settings and restarting
      -- Vim because of session persistence. Kill those buffers, and
      -- restart Vim to clear this session info out.
      -- winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
      -- inactive_winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
    })
  end,
}
