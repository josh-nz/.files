-- https://github.com/L3MON4D3/LuaSnip
local luasnip = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    -- https://github.com/rafamadriz/friendly-snippets
    "rafamadriz/friendly-snippets",
    -- https://github.com/saadparwaiz1/cmp_luasnip
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

-- https://github.com/hrsh7th/nvim-cmp
local nvim_cmp = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",
    -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    -- https://github.com/hrsh7th/cmp-buffer
    "hrsh7th/cmp-buffer",
    -- https://github.com/hrsh7th/cmp-nvim-lua
    -- "hrsh7th/cmp-nvim-lua",
  },
  config = function()
    -- Set up nvim-cmp.
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
          end,
        }
      }, {
        { name = "nvim_lsp_signature_help" },
        --{ name = 'nvim_lua' },
      }, {
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = "buffer" },
      }),
    })

    -- Set configuration for specific filetype.
    --cmp.setup.filetype("gitcommit", {
    --  sources = cmp.config.sources({
    --    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    --  }, {
    --    { name = "buffer" },
    --  }),
    --})

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- NOTE: This setup is currently performed in lsp-config.lua

    -- Set up lspconfig.
    --local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    --require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
    --  capabilities = capabilities,
    --})
  end,
}

return {
  luasnip,
  nvim_cmp,
}
