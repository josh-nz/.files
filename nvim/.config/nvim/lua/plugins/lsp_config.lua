return {
  {
    -- Configures Lua LSP for Neovim config, runtime, and plugins
    -- used for completion, annotations, and signatures of Neovim APIs
    -- https://github.com/folke/lazydev.nvim
    "folke/lazydev.nvim",
    enabled = true,
    ft = "lua", -- only load on lua files
    dependencies = {
      { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    },
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      -- Plugin and UI to automatically install LSPs to stdpath
      -- https://github.com/williamboman/mason.nvim
      "williamboman/mason.nvim",
      -- https://github.com/williamboman/mason-lspconfig.nvim
      "williamboman/mason-lspconfig.nvim",

      -- https://github.com/hrsh7th/cmp-nvim-lsp
      "hrsh7th/cmp-nvim-lsp",

      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      -- Doesn't support a lot of LSPs that I'd use:
      -- https://github.com/j-hui/fidget.nvim/wiki/Known-compatible-LSP-servers
      -- https://github.com/j-hui/fidget.nvim
      -- { "j-hui/fidget.nvim", opts = {} },
    },
    event = { "BufReadPost" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    config = function()
      -- Setup mason so it can manage 3rd party LSP servers
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "elixirls",
          "tailwindcss",
        },
      })

      -- Default handlers for LSP
      -- https://neovim.io/doc/user/lsp.html
      local rounded_corner_handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      -- By default, Neovim doesn't support everything that is in the LSP specification.
      -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local default_capabilities = vim.lsp.protocol.make_client_capabilities()
      local extended_capabilities = require("cmp_nvim_lsp").default_capabilities(default_capabilities)

      -- Enable the following language servers
      -- Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- https://luals.github.io/wiki/settings/
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace"
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        elixirls = {
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
              fetchDeps = false,
              enableTestLenses = false,
              suggestSpecs = true,
            },
          },
        },
        tailwindcss = {},
        gleam = {},
      }

      local lsp = require("lspconfig")
      for server_name, server_settings in pairs(servers) do
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for tsserver)
        server_settings.handlers = vim.tbl_deep_extend("force", {}, rounded_corner_handlers, server_settings.handlers or {})
        server_settings.capabilities = vim.tbl_deep_extend('force', {}, extended_capabilities, server_settings.capabilities or {})
        lsp[server_name].setup(server_settings)
      end

      -- This function gets run when an LSP attaches to a particular buffer.
      -- That is to say, every time a new file is opened that is associated with
      -- an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      -- function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user-lsp-config", { clear = true }),
        callback = function(event)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local opts = { buffer = event.buf }
          require("user.keymaps").lsp_keymaps(opts)

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },
}
