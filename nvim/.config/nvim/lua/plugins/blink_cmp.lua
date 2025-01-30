-- https://cmp.saghen.dev/


-- Can use this to test completion highlighting. Delete and retype `bc`.
-- vim.api.bc

return {
  "saghen/blink.cmp",
  enabled = vim.g.cmp_plugin == "blink",
  -- optional: provides snippets for the snippet source
  -- dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    -- "default" for mappings similar to built-in completion
    -- "super-tab" for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- "enter" for mappings similar to "super-tab" but with "enter" to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = "default",
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      -- My custom keymaps
      ["<C-k>"] = { "scroll_documentation_up", "fallback" },  -- default <C-b>
      ["<C-j>"] = { "scroll_documentation_down", "fallback" },  -- default <C-f>
      ["<C-l>"] = { "snippet_forward", "fallback" },  -- default <Tab>
      ["<C-h>"] = { "snippet_backward", "fallback" }, -- default <S-Tab>
    },
    enabled = function()
      -- Disable for some filetypes
      return not vim.tbl_contains({ "typr" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end,
    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp"s highlight groups
      -- Useful for when your theme doesn"t support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to "mono" for "Nerd Font Mono" or "normal" for "Nerd Font"
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono"
    },
    completion = {
      list = {
        selection = {
          auto_insert = false,
        },
      },
      menu = {
        border = "single",
        draw = {
          columns = function(ctx)
            if ctx.mode == "cmdline" then
              return { { "label", "label_description" } }
            else
              return { { "label", "label_description", gap = 1 }, { "kind" }, { "source_name" }  }
            end
          end,
          components = {
            -- label = {
            --   width = { max = function(ctx) return ctx.mode == "cmdline" and 20 or 60 end },
            -- },
          },
          -- treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0, -- default 500
        window = {
          border = "single",
          max_width = 180,  -- default 80
          max_height = 50,  -- default 20
        },
      },
      ghost_text = { enabled = false },
    },
    signature = {
      enabled = true,
      window = { border = "single" }
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      -- https://github.com/Saghen/blink.cmp/discussions/564
      -- default = function()
      --     local node = vim.treesitter.get_node()
      --     if
      --       node and vim.tbl_contains({ "comment", "line_comment", "comment_content", "block_comment" }, node:type())
      --     then
      --       return { "buffer" }
      --     else
      --       return {  "lsp", "path", "snippets", "buffer"  }
      --     end
      --   end,
      providers = {
        lsp = {
          -- Remove buffer as the default fallback, so buffer completions
          -- will show alongside the LSP suggestions. Instead, fallback to
          -- snippets. Could probably just leave this table empty.
          -- https://github.com/Saghen/blink.cmp/discussions/1021
          fallbacks = { "snippets" },
        },
        path = {
          opts = {
            show_hidden_files_by_default = true,
          },
        },
      },
    },
  },
  opts_extend = { "sources.default" }
}
