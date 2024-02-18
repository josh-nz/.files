-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    -- https://github.com/saadparwaiz1/cmp_luasnip
    "saadparwaiz1/cmp_luasnip",
    -- https://github.com/rafamadriz/friendly-snippets
    "rafamadriz/friendly-snippets",

    -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    -- https://github.com/onsails/lspkind.nvim
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

    -- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load()

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
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-u>"] = cmp.mapping.scroll_docs(4), -- scroll up preview
        ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- scroll down preview
        ["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
        ["<C-c>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", max_item_count = 5 }, -- text within current buffer
        { name = "path", max_item_count = 3 }, -- file system paths
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
        ghost_text = true,
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
