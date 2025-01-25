-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/keymap_utils.lua
local function bind(op, outer_opts)
  outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

-- https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1
local map = bind("")
local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")
local tnoremap = bind("t")
local ntnoremap = bind({ "n", "t" })

-- Original source https://github.com/pynappo/dotfiles/blob/main/.config/nvim/lua/pynappo/keymaps/init.lua
local function foo(keymaps, keymap_opts, extra_opts)
  extra_opts = extra_opts or {}
  local lazy_keymaps = extra_opts.lazy and {}
  keymap_opts = keymap_opts or {}
  for modes, maps in pairs(keymaps) do
    for _, m in pairs(maps) do
      local opts = vim.tbl_extend('force', keymap_opts, m[3] or {})
      if extra_opts.lazy then
        table.insert(lazy_keymaps, vim.tbl_extend('force', { m[1], m[2], mode = modes }, opts))
      else
        vim.keymap.set(modes, m[1], m[2], opts)
      end
    end
  end
  return lazy_keymaps
end

local function lazy_keymap(keymaps)
  local lazy_keymaps = {}
  for modes, mappings in pairs(keymaps) do
    for _, mapping in ipairs(mappings) do
      local final_mapping = vim.tbl_extend('force', { mode = modes, silent = true, noremap = true }, mapping)
      
      table.insert(lazy_keymaps, final_mapping)
    end
  end
  return lazy_keymaps
end


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
-- nnoremap("<M-h>", "<Cmd>wincmd h<CR>", { desc = "Move focus to the left window" })
-- nnoremap("<M-j>", "<Cmd>wincmd j<CR>", { desc = "Move focus to the lower window" })
-- nnoremap("<M-k>", "<Cmd>wincmd k<CR>", { desc = "Move focus to the upper window" })
-- nnoremap("<M-l>", "<Cmd>wincmd l<CR>", { desc = "Move focus to the right window" })
-- nnoremap("<M-p>", "<Cmd>wincmd p<CR>", { desc = "Move focus to the previous window" })

-- WezTerm handles these keymaps, passing them to wezterm_nvim_move.lua when necessary.
-- nnoremap("<C-h>", "<Cmd>wincmd h<CR>", { desc = "Move focus to the left window" })
-- nnoremap("<C-j>", "<Cmd>wincmd j<CR>", { desc = "Move focus to the lower window" })
-- nnoremap("<C-k>", "<Cmd>wincmd k<CR>", { desc = "Move focus to the upper window" })
-- nnoremap("<C-l>", "<Cmd>wincmd l<CR>", { desc = "Move focus to the right window" })
-- nnoremap("<C-p>", "<Cmd>wincmd p<CR>", { desc = "Move focus to the previous window" })

-- nnoremap("<M-Tab>", "<C-6>", { desc = "Switch to alternate buffer" })



-- nnoremap("H", "<Cmd>bp<CR>", "Previous buffer")
-- nnoremap("L", "<Cmd>bn<CR>", "Next buffer")

-- J and K to go up and down quickly, while keeping jump list clean
-- nnoremap("}", '<Cmd><C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>')
-- nnoremap("{", '<Cmd><C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>')
-- nnoremap("J", "}")
-- nnoremap("K", "{")

-- Remap for joining lines, since J is now a motion. But you can also leave this off and do :j as a command
-- nnoremap("gJ", "<Cmd>join<CR>")




-- Turn off highlighted results
nnoremap("<Esc>", "<Cmd>nohlsearch<CR><Esc>", { desc = "No search highlight" })

-- gF is a more useful default that gf as it will also go to the line number
nnoremap("gf", "gF", { desc = "Go to file" })

-- Send replaced char to black hole clip buffer instead of putting it in main clip buffer
nnoremap("x", '"_x')

-- Press 'U' for redo
-- nnoremap("U", "<C-r>")

-- Open alternate buffer in vertical split. Default is horizontal split.
-- Doesn't seem to work reliably.
nnoremap("<C-w><C-^>", "<C-w>v<C-^>", { desc = "Open alt buffer in vsplit" })

-- nnoremap('""', '<Cmd>registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>')

-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-bufremove.md#features
-- https://github.com/moll/vim-bbye
-- https://github.com/mhinz/vim-sayonara
-- https://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window
-- nnoremap(",d", "<Cmd>b#<bar>bd#<bar>b<CR>", { desc = "Close buffer and switch to alternative one. Keeps split open (but with edgecases)." })


-- Plugin development
-- nnoremap("<C-m>", "<Cmd>messages<CR>")
nnoremap("<M-l>", "<Cmd>Lazy reload poss<CR>")





-- Insert --

-- Currently have a very short Ctrl press (<0.01s) mapped to trigger Esc
-- via BetterTouchTool which looks to be working great. To configure this:
-- Select `Key Sequences / Typed Words` droplist item
-- Add a new item which brings up the recording keys screen
-- Press the desired key
-- Stop recording
-- Set `Trigger only if no further keyboard input is recognised for` to 0.01s
-- Save
-- Assign an action `Keyboard Keys`, `Esc`

-- This is also this option:
-- https://karabiner-elements.pqrs.org/
-- inoremap("df", "<Esc>")
-- inoremap("fd", "<Esc>")
-- inoremap("fj", "<Esc>")
-- inoremap("jf", "<Esc>")
-- inoremap("jk", "<Esc>")
-- inoremap("kj", "<Esc>")

-- inoremap("<C-d>", "<Del>")



-- Visual --

-- Disable Space bar since it'll be used as the leader key
vnoremap("<Space>", "<nop>")

-- vnoremap("fj", "<Esc>")










-- Terminal --

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
tnoremap("<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "fj", [[<C-\><C-n>]],  { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
tnoremap("<C-w>", [[<C-\><C-n><C-w>]], { desc = "Terminal change window shortcut" })



-- LSP keymaps - originally part of lsp_config.lua

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nnoremap("<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- The following are now default mappings in 0.10.0, and can be removed:
nnoremap("<C-w>d", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
nnoremap("<C-w><C-d>", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
nnoremap("[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
nnoremap("]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

function M.lsp_keymaps(opts)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Opens a popup that displays documentation about the word under your cursor
  --  See `:help K` for why this keymap.
  -- This is now a default mapping in 0.10.0 and can be removed:
  -- nnoremap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

  -- https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
  -- See also :h tui-input
  nnoremap("<C-S-k>", vim.lsp.buf.signature_help, opts)
  -- nnoremap("gs", vim.lsp.buf.signature_help, opts)


  nnoremap("<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  nnoremap("<leader>rn", vim.lsp.buf.rename, opts)

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })


  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  nnoremap("gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

  -- nnoremap("<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  -- nnoremap("<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  -- nnoremap("<leader>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts)

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  nnoremap("gd", vim.lsp.buf.definition, opts) -- <C-t> to jump back

  -- Find references for the word under your cursor.
  nnoremap("gr", vim.lsp.buf.references, opts)

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  nnoremap("gI", vim.lsp.buf.implementation, opts)

  -- Jump to the type of the word under your cursor.
  --  Useful when you"re not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  nnoremap("<leader>D", vim.lsp.buf.type_definition, opts)

  -- Find all the symbols in your current document.
  nnoremap("<leader>ds", vim.lsp.buf.document_symbol, opts)

  -- Find all the symbols in your current workspace.
  nnoremap("<leader>ws", vim.lsp.buf.workspace_symbol, opts)
end


function M.lsp_fzf_keymaps(opts)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Opens a popup that displays documentation about the word under your cursor
  --  See `:help K` for why this keymap.
  -- This is now a default mapping in 0.10.0 and can be removed:
  -- nnoremap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

  -- https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
  -- See also :h tui-input
  nnoremap("<C-S-k>", vim.lsp.buf.signature_help, opts)
  -- nnoremap("gs", vim.lsp.buf.signature_help, opts)

  nnoremap("<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })


  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  nnoremap("gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  nnoremap("gd", "<Cmd>FzfLua lsp_definitions<CR>", { desc = "[G]oto [D]efinition" })

  -- Find references for the word under your cursor.
  nnoremap("gr", "<Cmd>FzfLua lsp_references<CR>", { desc = "[G]oto [R]eferences" })

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  nnoremap("gI", "<Cmd>FzfLua lsp_implementations<CR>", { desc = "[G]oto [I]mplementation" })

  -- Jump to the type of the word under your cursor.
  --  Useful when you"re not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  nnoremap("<leader>D", "<Cmd>FzfLua lsp_typedefs<CR>", { desc = "Type [D]efinition" })

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  --  Duplicate of custom Telescope keymap <leader>fs
  nnoremap("<leader>ds", "<Cmd>FzfLua lsp_document_symbols<CR>", { desc = "[D]ocument [S]ymbols" })

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  nnoremap("<leader>ws", "<Cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "[W]orkspace [S]ymbols" })
end


function M.lsp_telescope_keymaps(opts)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Opens a popup that displays documentation about the word under your cursor
  --  See `:help K` for why this keymap.
  -- This is now a default mapping in 0.10.0 and can be removed:
  -- nnoremap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

  -- https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
  -- See also :h tui-input
  nnoremap("<C-S-k>", vim.lsp.buf.signature_help, opts)
  -- nnoremap("gs", vim.lsp.buf.signature_help, opts)

  nnoremap("<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })


  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  nnoremap("gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

  local ts = require("telescope.builtin")

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  nnoremap("gd", ts.lsp_definitions, { desc = "[G]oto [D]efinition" })

  -- Find references for the word under your cursor.
  nnoremap("gr", ts.lsp_references, { desc = "[G]oto [R]eferences" })

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  nnoremap("gI", ts.lsp_implementations, { desc = "[G]oto [I]mplementation" })

  -- Jump to the type of the word under your cursor.
  --  Useful when you"re not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  nnoremap("<leader>D", ts.lsp_type_definitions, { desc = "Type [D]efinition" })

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  --  Duplicate of custom Telescope keymap <leader>fs
  nnoremap("<leader>ds", ts.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  nnoremap("<leader>ws", ts.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
end





-- Telescope keymaps - originally part of telescope.lua
function M.telescope_keymaps(builtin)
  -- find_files calls `rg --files --colour` as priority, see link for details.
  -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/__files.lua#L272
  -- nnoremap("<C-p>", builtin.find_files, {})
  nnoremap("<leader>ff", builtin.find_files, { desc = "Telescope find files" })
  -- :help telescope.defaults.vimgrep_arguments
  -- will show the default arguments passed to ripgrep.
  nnoremap("<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
  nnoremap("<leader>fb", function()
    builtin.buffers({
      -- ignore_current_buffer = true,
      sort_mru = true,
      -- sort_lastused = true,
    })
  end, { desc = "Telescope buffers" })
  nnoremap("<leader>fh", builtin.help_tags, { desc = "Telescope help tags " })
  nnoremap("<leader>fo", builtin.oldfiles, { desc = "Telescope old files" })
  nnoremap("<leader>fv", builtin.vim_options, { desc = "Telescope vim options" })
  nnoremap("<leader>fc", function()
    builtin.colorscheme({ enable_preview = true, initial_mode = "normal" })
  end, { desc = "Telescope colorscheme picker" })
  nnoremap("<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
  nnoremap("<leader>fj", builtin.jumplist, { desc = "Telescope jumplist" })
  --  Duplicate of custom debug keymap <leader>ds
  nnoremap("<leader>fs", function()
    builtin.lsp_document_symbols({ show_line = true })
  end, { desc = "Telescope lsp document symbols" })

  -- Shortcut for searching your neovim configuration files
  nnoremap("<leader>fn", function()
    builtin.find_files { cwd = vim.fn.stdpath("config") }
  end, { desc = "Telescope nvim files" })

  -- Slightly advanced example of overriding default behavior and theme
  vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end, { desc = "Telescope fuzzily search current buffer" })
end




-- Fzflua keymaps
function M.fzflua_keymaps()
  -- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#commands
  nnoremap("<C-p>", "<Cmd>FzfLua files<CR>", { desc = "Fzf find files" })
  nnoremap("<C-b>", "<Cmd>FzfLua buffers<CR>", { desc = "Fzf find buffers" })
  nnoremap("<leader>g", "<Cmd>FzfLua grep<CR>", { desc = "Fzf grep" })
end




-- Neo-tree keymaps - originally part of neo_tree.lua
function M.neo_tree_keymaps()
  -- `reveal` will open NeoTree and highlight the file of the current buffer.
  -- Use `focus` or `show` to not highlight the file of the current buffer.
  nnoremap("<leader>t", "<Cmd>Neotree filesystem left toggle<CR>", { desc = "Neotree toggle" })
  nnoremap("<leader>tf", "<Cmd>Neotree filesystem reveal left<CR>", { desc = "Neotree reveal" })
  -- <Cmd>Neotree buffers reveal float
end




-- Oil file manager keymaps
function M.oil_keymaps()
  nnoremap("-", "<Cmd>Oil<CR>", { desc = "Open Oil file manager" })
end




-- Debug keymaps - originally part of debugging.lua
function M.dap_keymaps(dap)
  nnoremap("<F5>", dap.continue, { desc = "Debug start/continue" })
  nnoremap("<F10>", dap.step_over, { desc = "Debug step over" })
  nnoremap("<F11>", dap.step_into, { desc = "Debug step into" })
  nnoremap("<F12>", dap.step_out, { desc = "Debug step out" })
  nnoremap("<Leader>b", dap.toggle_breakpoint, { desc = "Debug toggle breakpoint" })
  nnoremap("<Leader>B", dap.set_breakpoint, { desc = "Debug set breakpoint" })
  nnoremap("<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end, { desc = "Debug ?some custom breakpoint?" })
  nnoremap("<Leader>dr", dap.repl.open, { desc = "Debug open REPL" })
  nnoremap("<Leader>dl", dap.run_last, { desc = "Debug ?run last?" })
end

function M.dap_ui_keymaps(dapui, widget)
  -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
  nnoremap("<F7>", dapui.toggle, { desc = "Debug see last session result" })

  vim.keymap.set({ "n", "v" }, "<Leader>dh", widget.hover, { desc = "Debug ?widget hover?" })
  vim.keymap.set({ "n", "v" }, "<Leader>dp", widget.preview, { desc = "Debug ?widget.preview?" })
  nnoremap("<Leader>df", function()
    widget.centered_float(widget.frames)
  end, { desc = "Debug ?widget.centered_float.frames?" })
  nnoremap("<Leader>ds", function()
    widget.centered_float(widget.scopes)
  end, { desc = "Debug ?widget.centered_float.scopes?" })
end





function M.lazygit_keymaps()
  nnoremap("<leader>l", "<Cmd>LazyGit<CR>", { desc = "LazyGit" })
end




-- Vim-test keymaps
function M.vim_test_keymaps()
  nnoremap("<leader>ut", "<Cmd>TestNearest<CR>", { desc = "Run test nearest cursor" })
  nnoremap("<leader>uT", "<Cmd>TestFile<CR>", { desc = "Run tests in current file" })
  nnoremap("<leader>ua", "<Cmd>TestSuite<CR>", { desc = "Run all tests" })
  nnoremap("<leader>ul", "<Cmd>TestLast<CR>", { desc = "Run the last test" })
  nnoremap("<leader>ug", "<Cmd>TestVisit<CR>", { desc = "Visit test file from which tests were last run" })
end




-- Navigator keymaps
function M.navigator_keymaps()
  ntnoremap("<M-h>", "<Cmd>NavigatorLeft<CR>", { desc = "Move mux focus to the left window" })
  ntnoremap("<M-j>", "<Cmd>NavigatorDown<CR>", { desc = "Move mux focus to the lower window" })
  ntnoremap("<M-k>", "<Cmd>NavigatorUp<CR>", { desc = "Move mux focus to the upper window" })
  ntnoremap("<M-l>", "<Cmd>NavigatorRight<CR>", { desc = "Move mux focus to the right window" })
  ntnoremap("<M-p>", "<Cmd>NavigatorPrevious<CR>", { desc = "Move mux focus to the previous window" })
end





-- Smart-splits keymaps
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





-- WezTerm_nvim_move keymaps
function M.wezterm_nvim_move_keymaps(move)
  nnoremap("<C-h>", function() move("h") end, { desc = "Move WezTerm focus to the left window" })
  nnoremap("<C-j>", function() move("j") end, { desc = "Move WezTerm focus to the lower window" })
  nnoremap("<C-k>", function() move("k") end, { desc = "Move WezTerm focus to the upper window" })
  nnoremap("<C-l>", function() move("l") end, { desc = "Move WezTerm focus to the right window" })

  -- nnoremap("<C-;>", function() move_fn("j") end, { desc = "Move WezTerm focus to the lower window" })
end

-- Possession.nvim keymaps
function M.possession_keymaps()
  nnoremap("<leader>p", "<Cmd>Telescope possession list<CR>", { desc = "Telescope show saved sessions" })
end

-- Snacks keymaps
function M.snacks()
  return lazy_keymap({
    [{ "n" }] = {
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
    [{ "n", "v" }] = {
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    },
    [{ "n", "t" }] = {
      -- { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
      -- { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
    },
  })
end


-- Snacks toggle keymaps
function M.snacks_toggles()
  Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
  Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
  Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
  Snacks.toggle.diagnostics():map("<leader>ud")
  Snacks.toggle.line_number():map("<leader>ul")
  Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
  Snacks.toggle.treesitter():map("<leader>uT")
  Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
  Snacks.toggle.inlay_hints():map("<leader>uh")
  Snacks.toggle.indent():map("<leader>ug")
  Snacks.toggle.dim():map("<leader>uD")
end



return M
