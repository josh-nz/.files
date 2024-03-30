local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local ntnoremap = require("user.keymap_utils").ntnoremap


local M = {}

-- Normal --

-- Disable Space bar since it'll be used as the leader key
nnoremap("<Space>", "<Nop>")

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
-- nnoremap("<C-i>", "<C-i>zz")
-- nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")
-- nnoremap("g*", "g*zz")
-- nnoremap("g#", "g#zz")

-- Better window navigation
-- See `:help wincmd` for a list of all window commands
nnoremap("<M-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" })
nnoremap("<M-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" })
nnoremap("<M-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" })
nnoremap("<M-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" })
nnoremap("<M-p>", ":wincmd p<CR>", { desc = "Move focus to the previous window" })

nnoremap("<M-Tab>", "<C-6>", { desc = "Switch to alternate buffer" })



-- nnoremap("H", ":bp<CR>", "Previous buffer")
-- nnoremap("L", ":bn<CR>", "Next buffer")

-- J and K to go up and down quickly, while keeping jump list clean
-- nnoremap("}", ':<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>')
-- nnoremap("{", ':<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>')
-- nnoremap("J", "}")
-- nnoremap("K", "{")

-- Remap for joining lines, since J is now a motion. But you can also leave this off and do :j as a command
-- nnoremap("gJ", ":join<CR>")



-- Turn off highlighted results
nnoremap("<Esc>", ":nohlsearch<CR><Esc>", { desc = "No search highlight" })

-- gF is a more useful default that gf as it will also go to the line number
nnoremap("gf", "gF", { desc = "Go to file" })

-- Send replaced char to black hole clip buffer instead of putting it in main clip buffer
nnoremap("x", '"_x')

-- Press 'U' for redo
-- nnoremap("U", "<C-r>")

-- Open alternate buffer in vertical split. Default is horizontal split.
-- Doesn't seem to work reliably.
nnoremap("<C-w><C-^>", "<C-w>v<C-^>")


-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-bufremove.md#features
-- https://github.com/moll/vim-bbye
-- https://github.com/mhinz/vim-sayonara
-- https://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window
-- nnoremap(",d", ":b#<bar>bd#<bar>b<CR>", { desc = "Close buffer and switch to alternative one. Keeps split open (but with edgecases)." })

nnoremap("<leader>l", ":LazyGit<CR>", { desc = "LazyGit" })





-- Insert --

-- Map jj to <esc>
-- inoremap("df", "<Esc>")
-- inoremap("fd", "<Esc>")
inoremap("fj", "<Esc>")
-- inoremap("jf", "<Esc>")
-- inoremap("jk", "<Esc>")
-- inoremap("kj", "<Esc>")

inoremap("<C-d>", "<Del>")



-- Visual --

-- Disable Space bar since it'll be used as the leader key
vnoremap("<Space>", "<nop>")

vnoremap("fj", "<Esc>")










-- Terminal --

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })





-- LSP keymaps - originally part of lsp_config.lua

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

function M.lsp_keymaps(opts)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- <C-t> to jump back
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  -- -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  -- -- vim.keymap.set("n", "<leader>wl", function()
  -- --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- -- end, opts)
  -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = opts.buffer, desc = 'LSP: ' .. desc })
  end

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

  -- Find references for the word under your cursor.
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- Opens a popup that displays documentation about the word under your cursor
  --  See `:help K` for why this keymap.
  map('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end





-- Telescope keymaps - originally part of telescope.lua
function M.telescope_keymaps(builtin)
  -- find_files calls `rg --files --colour` as priority, see link for details.
  -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/__files.lua#L272
  vim.keymap.set("n", "<C-p>", builtin.find_files, {})
  vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
  -- :help telescope.defaults.vimgrep_arguments
  -- will show the default arguments passed to ripgrep.
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
  vim.keymap.set("n", "<leader>fb", function()
    builtin.buffers({
      -- ignore_current_buffer = true,
      sort_mru = true,
      -- sort_lastused = true,
    })
  end, {})
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
  vim.keymap.set("n", "<leader>fv", builtin.vim_options, {})
  vim.keymap.set("n", "<leader>fc", function()
    builtin.colorscheme({ enable_preview = true, initial_mode = "normal" })
  end, {})
  vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
  vim.keymap.set("n", "<leader>fj", builtin.jumplist, {})
  vim.keymap.set("n", "<leader>fs", function()
    builtin.lsp_document_symbols({ show_line = true })
  end, {})

  -- Shortcut for searching your neovim configuration files
  vim.keymap.set("n", "<leader>fn", function()
    builtin.find_files { cwd = vim.fn.stdpath("config") }
  end, { desc = "[F]ind in [N]eovim files" })

  -- Slightly advanced example of overriding default behavior and theme
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end, { desc = '[/] Fuzzily search in current buffer' })
end





-- Neo-tree keymaps - originally part of neo_tree.lua
function M.neo_tree_keymaps()
  -- `reveal` will open NeoTree and highlight the file of the current buffer.
  -- Use `focus` or `show` to not highlight the file of the current buffer.
  vim.keymap.set("n", "<leader>t", ":Neotree filesystem left toggle<CR>")
  vim.keymap.set("n", "<leader>tf", ":Neotree filesystem reveal left<CR>")
  -- :Neotree buffers reveal float
end





-- Debug keymaps - originally part of debugging.lua
function M.dap_keymaps(dap)
  vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: start/continue" })
  vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
  vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
  vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: step out" })
  vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
  vim.keymap.set("n", "<Leader>B", dap.set_breakpoint, { desc = "Debug: set breakpoint" })
  vim.keymap.set("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end, { desc = "Debug: ?some custom breakpoint?" })
  vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Debug: open REPL" })
  vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Debug: ?run last?" })
end

function M.dap_ui_keymaps(dapui, widget)
  -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
  vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: see last session result" })

  vim.keymap.set({ "n", "v" }, "<Leader>dh", widget.hover, { desc = "Debug: ?widget hover?" })
  vim.keymap.set({ "n", "v" }, "<Leader>dp", widget.preview, { desc = "Debug: ?widget.preview?" })
  vim.keymap.set("n", "<Leader>df", function()
    widget.centered_float(widget.frames)
  end, { desc = "Debug: ?widget.centered_float.frames?" })
  vim.keymap.set("n", "<Leader>ds", function()
    widget.centered_float(widget.scopes)
  end, { desc = "Debug: ?widget.centered_float.scopes?" })
end




-- Vim-test keymaps
function M.vim_test_keymaps()
  nnoremap("<leader>ut", ":TestNearest<CR>", { desc = "Run test nearest cursor" })
  nnoremap("<leader>uT", ":TestFile<CR>", { desc = "Run tests in current file" })
  nnoremap("<leader>ua", ":TestSuite<CR>", { desc = "Run all tests" })
  nnoremap("<leader>ul", ":TestLast<CR>", { desc = "Run the last test" })
  nnoremap("<leader>ug", ":TestVisit<CR>", { desc = "Visit test file from which tests were last run" })
end




-- Navigator keymaps
function M.navigator_keymaps()
  ntnoremap("<M-h>", ":NavigatorLeft<CR>", { desc = "Move mux focus to the left window" })
  ntnoremap("<M-j>", ":NavigatorDown<CR>", { desc = "Move mux focus to the lower window" })
  ntnoremap("<M-k>", ":NavigatorUp<CR>", { desc = "Move mux focus to the upper window" })
  ntnoremap("<M-l>", ":NavigatorRight<CR>", { desc = "Move mux focus to the right window" })
  ntnoremap("<M-p>", ":NavigatorPrevious<CR>", { desc = "Move mux focus to the previous window" })
end





-- Navigator keymaps
function M.smart_splits_keymaps(ss)
  nnoremap("<M-h>", ss.move_cursor_left, { desc = "Move mux focus to the left window" })
  nnoremap("<M-j>", ss.move_cursor_down, { desc = "Move mux focus to the lower window" })
  nnoremap("<M-k>", ss.move_cursor_up, { desc = "Move mux focus to the upper window" })
  nnoremap("<M-l>", ss.move_cursor_right, { desc = "Move mux focus to the right window" })
  nnoremap("<M-p>", ss.move_cursor_previous, { desc = "Move mux focus to the previous window" })

  nnoremap("<M-S-h>", ss.resize_left, { desc = "Resize window left" })
  nnoremap("<M-S-j>", ss.resize_down, { desc = "Resize window down" })
  nnoremap("<M-S-k>", ss.resize_up, { desc = "Resize window up" })
  nnoremap("<M-S-l>", ss.resize_right, { desc = "Resize window right" })

  nnoremap("<leader>bh", ss.swap_buf_left, { desc = "Swap buffer left" })
  nnoremap("<leader>bj", ss.swap_buf_down, { desc = "Swap buffer down" })
  nnoremap("<leader>bk", ss.swap_buf_up, { desc = "Swap buffer up" })
  nnoremap("<leader>bl", ss.swap_buf_right, { desc = "Swap buffer right" })
end

return M
