-- https://github.com/neovim/nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
  dependencies = {
    -- Plugin and UI to automatically install LSPs to stdpath
    -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",
    -- https://github.com/williamboman/mason-lspconfig.nvim
    "williamboman/mason-lspconfig.nvim",

    -- https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",

    -- Install neodev for better nvim configuration and plugin authoring via lsp configurations
    -- https://github.com/folke/neodev.nvim
    "folke/neodev.nvim",

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    -- local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds -- Has to load keymaps before pluginslsp

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
      -- See `:h mason-lspconfig.setup_handlers()`
      ---@type table<string, fun(server_name: string)>?
      -- handlers = {
      --   function(server_name)
      --     local server = servers[server_name] or {}
      --     -- This handles overriding only values explicitly passed
      --     -- by the server configuration above. Useful when disabling
      --     -- certain features of an LSP (for example, turning off formatting for tsserver)
      --     server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      --     require('lspconfig')[server_name].setup(server)
      --   end,
      -- }
    })

    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({
      -- add any options here, or leave empty to use the default settings
    })

    local servers = {
      -- https://luals.github.io/wiki/settings/
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
            -- workspace = {
            --   checkThirdParty = false,
            --   -- Tells lua_ls where to find all the Lua files that you have loaded
            --   -- for your neovim configuration.
            --   -- NOTE: This might be what neodev.nvim does automatically?
            --   library = {
            --     '${3rd}/luv/library',
            --     unpack(vim.api.nvim_get_runtime_file('', true)),
            --   },
            --   -- If lua_ls is really slow on your computer, you can try this instead:
            --   -- library = { vim.env.VIMRUNTIME },
            -- },
          },
        },
      },
      elixirls = {},
    }

    -- Default handlers for LSP
    -- https://neovim.io/doc/user/lsp.html
    local default_handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    -- nvim-cmp-lsp supports additional completion capabilities,
    -- adds `nvim-lsp` as a completion source as used by completions.lua
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    local extended_capabilities = require("cmp_nvim_lsp").default_capabilities(default_capabilities)

    -- local on_attach = function(_client, buffer_number)
    --   -- Pass the current buffer to map lsp keybinds
    --   map_lsp_keybinds(buffer_number)
    -- end

    local lsp = require("lspconfig")
    -- Iterate over our servers and set them up
    for name, config in pairs(servers) do
      lsp[name].setup({
        capabilities = extended_capabilities,
        filetypes = config.filetypes,
        handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
        -- on_attach = on_attach,
        settings = config.settings,
      })
    end

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
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
}
