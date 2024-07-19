-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    -- https://github.com/L3MON4D3/LuaSnip
    {
      "L3MON4D3/LuaSnip",
      run = "make install_jsregexp",
      dependencies = {
        {
          -- https://github.com/rafamadriz/friendly-snippets
          "rafamadriz/friendly-snippets",
          config = function()
            -- Load snippets
            require("luasnip.loaders.from_vscode").lazy_load()
          end
        },
      },
    },
    -- https://github.com/saadparwaiz1/cmp_luasnip
    "saadparwaiz1/cmp_luasnip",

    -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    -- https://github.com/onsails/lspkind.nvim
    -- Adds icons to the completion types
    "onsails/lspkind.nvim",

    -- https://github.com/hrsh7th/cmp-buffer
    "hrsh7th/cmp-buffer",
    -- https://github.com/hrsh7th/cmp-path
    "hrsh7th/cmp-path",
    -- https://github.com/hrsh7th/cmp-cmdline
    "hrsh7th/cmp-cmdline",
    -- https://github.com/hrsh7th/cmp-nvim-lua
    -- "hrsh7th/cmp-nvim-lua",  -- folke/neodev.nvim as used in lsp_config.lua might provide these completions as an alternative
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
  	local lspkind = require("lspkind")

    -- Not sure what this does, it's part of the Kickstart script.
    luasnip.config.setup({})

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    -- Set up nvim-cmp.
    cmp.setup({
      -- enabled = function()
      --   -- disable completion if the cursor is `Comment` syntax group.
      --   return not cmp.config.context.in_syntax_group('Comment')
      -- end,
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      performance = {
        -- max_view_entries = 100,
      },
      -- preselect = "None", -- "Item" preselects item as specified by source.
      mapping = cmp.mapping.preset.insert({
        -- https://github.com/hrsh7th/nvim-cmp/issues/809
        ["<C-p>"] = cmp.mapping(
          cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          { "i", "c" }
        ),
        ["<C-n>"] = cmp.mapping(
          cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          { "i", "c" }
        ),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        -- Manually trigger a completion from nvim-cmp.
        -- Generally you don't need this, because nvim-cmp will display
        -- completions whenever it has completion options available.
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
        ["<C-c>"] = cmp.mapping.abort(), -- close completion window, also <C-e>

        -- Select highlighted word, won't complete if no highlight.
        -- This is useful when an LSP defines a preselect for a completion,
        -- since we'd typically be pressing <CR> about now to go to the next
        -- line anyway, so might as well trigger the completion at the same time.
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
        -- Accept ([y]es) the completion.
        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
          { "i", "c" }
        ),

        -- Think of <C-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <C-l> will move you to the right of each of the expansion locations.
        -- <C-h> is similar, except moving you backwards.
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            cmp.complete_common_string()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps

        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   elseif has_words_before() then
        --     cmp.complete()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
      }),


      -- sources for autocompletion
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
          end,
        }, -- lsp
        {
          -- optional completion source for Neovim Lua require statements and module annotations
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        },
        { name = "nvim_lsp_signature_help" },
        {
          name = "buffer",
          -- max_item_count = 5,
        }, -- text within current buffer
        { name = "path" }, -- file system paths
        {
          name = "luasnip",
          -- max_item_count = 3,
          -- group_index = 2, -- Easier than using the table of tables syntax for groups.
        }, -- For luasnip users.
        -- { name = "vsnip" }, -- For vsnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }),


      -- Enable pictogram icons for lsp/autocompletion
      formatting = {
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "…",
          show_labelDetails = true,
          menu = ({
            nvim_lsp = "[lsp]  ",
            nvim_lsp_signature_help = "[lsp sig]  ",
            buffer = "[buffer]  ",
            path = "[path]  ",
            luasnip = "[luasnip]  ",
            nvim_lsp_document_symbol = "[lsp sym]  ",
            cmdline = "[cmdline]  ",
          })
        }),
      },
      experimental = {
        -- ghost_text = true,
      },
    })


    -- Configuration for these other completion types below looks to inherit
    -- from the above general completion setup as a starting point.



    -- Set configuration for specific filetype.
    -- cmp.setup.filetype("gitcommit", {
    --   sources = cmp.config.sources({
    --     { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    --   }, {
    --     { name = "buffer" },
    --   }),
    -- }),

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      -- We need to override the presets above here to
      -- get the Tab toggling working, otherwise Tab will
      -- insert a Tab character. I could bind Tab myself,
      -- but why bother. This also means having to set
      -- some overrides defined above again, sadly.
      mapping = cmp.mapping.preset.cmdline({
        ["<C-p>"] = cmp.mapping(
          cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          { "i", "c" }
        ),
        ["<C-n>"] = cmp.mapping(
          cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          { "i", "c" }
        ),
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
          { "i", "c" }
        ),
      }),
      sources = cmp.config.sources({
        -- Document symbol completions are triggered by `/@`
        { name = "nvim_lsp_document_symbol" },
        { name = "buffer" },
      }),
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      -- This preset will override any keymaps defined above, so
      -- we need to repeat them here. It also binds different keys
      -- like Tab, which overrides the native Vim autocomplete, at
      -- least for the : cmdline autocomplete. I think it's best to
      -- define the mappings above to work in command mode and ignore
      -- anything here. It also retains the Bash style tab completion
      -- I have already configured for the native Vim autocomplete.

      -- mapping = cmp.mapping.preset.cmdline({
      --   ["<C-p>"] = cmp.mapping(
      --     cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      --     { "i", "c" }
      --   ),
      --   ["<C-n>"] = cmp.mapping(
      --     cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      --     { "i", "c" }
      --   ),
      --   ["<C-y>"] = cmp.mapping(
      --     cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      --     { "i", "c" }
      --   ),
      -- }),
      sources = cmp.config.sources({
        { name = "cmdline" },
        { name = "path" },
      }),
      -- sorting = {
      --   comparators = {
      --     cmp.config.compare.sort_text,
      --   }
      -- },
      -- matching = {
      --   -- Whether to allow symbols in matches if the match is not a prefix match.
      --   disallow_symbol_nonprefix_matching = false,
      -- },
    })
  end,
}
