return {
  -- https://github.com/mason-org/mason-lspconfig.nvim
  "mason-org/mason-lspconfig.nvim",
  enabled = true,
  dependencies = {
    {
      -- Configures Lua LSP for Neovim config, runtime, and plugins
      -- used for completion, annotations, and signatures of Neovim APIs
      -- https://github.com/folke/lazydev.nvim
      "folke/lazydev.nvim",
      enabled = true,
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          { path = "snacks.nvim", words = { "Snacks" } },
          { path = "lazy.nvim", words = { "LazyVim" } },
        },
      },
    },

    -- Plugin and UI to automatically install LSPs to stdpath
    -- https://github.com/mason-org/mason.nvim
    {
      "mason-org/mason.nvim",
      opts = {},
    },

    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",

    {
      -- https://github.com/hrsh7th/cmp-nvim-lsp
      "hrsh7th/cmp-nvim-lsp",
      enabled = vim.g.cmp_plugin == "nvim-cmp",
    },

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- Doesn't support a lot of LSPs that I'd use:
    -- https://github.com/j-hui/fidget.nvim/wiki/Known-compatible-LSP-servers
    -- https://github.com/j-hui/fidget.nvim
    -- { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()

    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = {
        "lua_ls",
        "elixirls",
        -- "tailwindcss",
      },
    })



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
        cmd = { "/Users/josh/.local/share/nvim/mason/bin/elixir-ls" },
        -- https://github.com/elixir-lsp/elixir-ls?tab=readme-ov-file#elixirls-configuration-settings
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            incrementalDialyzer = true,
            fetchDeps = false,
            enableTestLenses = false,
            suggestSpecs = true,
            signatureAfterComplete = true,
          },
        },
      },
      tailwindcss = {
        -- filetypes = {
        --   "html",
        -- },
      },
      gleam = {},
    }

    -- https://neovim.io/doc/user/lsp.html
    for server_name, server_config in pairs(servers) do
      -- LSP servers and clients are able to communicate to each other what features they support.
      -- By default, Neovim doesn't support everything that is in the LSP specification.
      -- When you add blink, luasnip, etc. Neovim now has *more* capabilities.
      -- So, we create new capabilities with blink and the specific LSP configuration,
      -- and then broadcast that to the servers.
      if vim.g.cmp_plugin == "blink" then
        server_config.capabilities = require("blink.cmp").get_lsp_capabilities(server_config.capabilities, true) -- true will include the nvim default capabilities.
      else
        local default_capabilities = vim.lsp.protocol.make_client_capabilities()
        local extended_capabilities = require("cmp_nvim_lsp").default_capabilities(default_capabilities)
        server_config.capabilities = vim.tbl_deep_extend("force", {}, extended_capabilities, server_config.capabilities or {})
      end

      vim.lsp.config(server_name, server_config)
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
        local keymaps = require("user.keymaps")
        keymaps.lsp_bultins(opts)
        -- keymaps.lsp_nvim_native(opts)
        -- keymaps.lsp_fzf_picker(opts)
        keymaps.lsp_snacks_picker(opts)

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })




    -- https://www.reddit.com/r/neovim/comments/1kz0a23/nvim_0112_bug_fixes_and_vimlspenable_related/
    -- This autocommand will stop all LSPs when NeoVim exits. Apparently some LSPs, such as the Rust
    -- analyzer, keep running for reasons. Others, like the Lua LS, are automatically killed by
    -- NeoVim without the need for the following autocommand.
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        vim.iter(vim.lsp.get_clients()):each(function(client)
          client:stop()
        end)
      end,
    })
  end,
}
