-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
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
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- Manually trigger a completion from nvim-cmp.
        -- Generally you don't need this, because nvim-cmp will display
        -- completions whenever it has completion options available.
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<C-c>"] = cmp.mapping.abort(), -- close completion window
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
        -- Accept ([y]es) the completion.
        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        -- Think of <C-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

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
        { name = "nvim_lsp" }, -- lsp
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", max_item_count = 5 }, -- text within current buffer
        { name = "path" }, -- file system paths
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip", max_item_count = 3 }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }),

      -- sources = cmp.config.sources({
      --     {
      --       name = "nvim_lsp",
      --       entry_filter = function(entry, ctx)
      --         return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
      --       end,
      --     },
      --   }, {
      --     { name = "nvim_lsp_signature_help" },
      --     --{ name = 'nvim_lua' },
      --   }, {
      --     -- { name = "vsnip" }, -- For vsnip users.
      --     { name = "luasnip" }, -- For luasnip users.
      --     -- { name = 'ultisnips' }, -- For ultisnips users.
      --     -- { name = 'snippy' }, -- For snippy users.
      --   }, {
      --     { name = "buffer" },
      -- }),

      -- Enable pictogram icons for lsp/autocompletion
      formatting = {
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "…",
        }),
      },
      experimental = {
        -- ghost_text = true,
      },
    })


    -- Set configuration for specific filetype.
    -- cmp.setup.filetype("gitcommit", {
    --   sources = cmp.config.sources({
    --     { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    --   }, {
    --     { name = "buffer" },
    --   }),
    -- }),

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline({ "/", "?" }, {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = "nvim_lsp_document_symbol" },
    --   }, {
    --     { name = "buffer" },
    --   }),
    -- })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline(":", {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = "path" },
    --   }, {
    --     { name = "cmdline" },
    --   }),
    -- })
  end,
}
