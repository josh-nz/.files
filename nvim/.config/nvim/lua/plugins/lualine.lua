-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- https://github.com/ThePrimeagen/harpoon
    -- "ThePrimeagen/harpoon",
  },
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
          -- "filetype",
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
          -- "tabs",
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
