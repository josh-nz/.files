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
            }
          }
        }
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
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        require("user.keymaps").lsp_keymaps(opts)
      end,
    })
  end,
}
