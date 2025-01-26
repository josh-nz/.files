-- https://cmp.saghen.dev/

return {
  "saghen/blink.cmp",
  enabled = true,
  -- optional: provides snippets for the snippet source
  -- dependencies = "rafamadriz/friendly-snippets",
  version = "0.10.0",
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
          columns = { { "label", "label_description", gap = 1 }, { "kind" }, { "source_name" }  },
          treesitter = { "lsp" },
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
      cmdline = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then return { "buffer" } end
        -- Commands
        if type == ":" or type == "@" then return { "cmdline", "path", } end  -- added path source
        return {}
      end,
      providers = {
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
