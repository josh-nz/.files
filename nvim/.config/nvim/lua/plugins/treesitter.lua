-- https://github.com/nvim-treesitter/nvim-treesitter
-- Good video explaining this at https://www.youtube.com/watch?v=kYXcxJxJVxQ
return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  lazy = false,
  -- dependencies = {
  --   -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  --   -- Good videos explaining this at https://www.youtube.com/watch?v=ff0GYrK3nT0
  --   -- and at https://www.youtube.com/watch?v=FuYQ7M73bC0
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --
  --   -- https://github.com/nvim-treesitter/nvim-treesitter-context
  --   -- This pins the current scope to top of file
  --   -- "nvim-treesitter/nvim-treesitter-context",
  -- },
  branch = "main",
  build = ":TSUpdate",
  init = function()

    -- https://github.com/MeanderingProgrammer/treesitter-modules.nvim
    -- The above plugin replacates a lot of what Treesitter used to provide
    -- before it removed these functions in favour of just being a basic API.
    -- Most of the above plugin is replicated below except for incremental
    -- selection.

    local ensure_installed = {
      -- These parsers are bundled with NeoVim. We must install them via Treesitter
      -- I don't think we need to keep them in sync any more. Refer to :checkhealth
      -- which doesn't report any errors like the Treesitter master branch used to.
      -- "c",
      -- "lua",
      -- "markdown",
      -- "markdown_inline",
      -- "query",
      -- "vim",
      -- "vimdoc",

      -- Other parsers I've chosen to install:
      "comment",
      "eex",
      "elixir",
      "gleam",
      "go",
      "heex",
      "html",
      "javascript",
      "json",
      "regex",  -- Requrired for Snacks plugin.
      "typescript",
    }

    -- Installs asyncronously, no-op if already instealled.
    require("nvim-treesitter").install(ensure_installed)

    local filetypes = {}
    for _, lang in ipairs(ensure_installed) do
      for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
        table.insert(filetypes, ft)
      end
    end

    -- Ensure tree-sitter is enabled after opening a file for target language.

    -- WARN: Do not use "*" here - snacks.nvim is buggy and vim.notify
    -- triggers FileType events internally causing infinite callback loops.
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Start treesitter",
      group = vim.api.nvim_create_augroup("start_treesitter", { clear = true }),
      pattern = filetypes,
      callback = function(ev)

        -- local filetype = vim.bo[ev.buf].filetype
        local filetype = ev.match
        local lang = vim.treesitter.language.get_lang(filetype)
        -- if not lang or not vim.treesitter.language.add(lang) then return end
        if not lang then return end

        -- Start treesitter syntax highlighting.
        vim.treesitter.start(ev.buf)

        -- Enable treesitter indenting.
        if vim.treesitter.query.get(lang, "indents") then
          vim.opt_local.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
        end

        -- Enable treesitter folding.
        if vim.treesitter.query.get(lang, "folds") then
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
      end,
    })
  end,
}
