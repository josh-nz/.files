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

nnoremap("<C-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" })
nnoremap("<C-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" })
nnoremap("<C-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" })
nnoremap("<C-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" })
nnoremap("<C-p>", ":wincmd p<CR>", { desc = "Move focus to the previous window" })

-- nnoremap("<M-Tab>", "<C-6>", { desc = "Switch to alternate buffer" })



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


-- Plugin development
nnoremap("<C-m>", ":messages<CR>")
nnoremap("<M-l>", ":Lazy reload poss<CR>")





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

vnoremap("fj", "<Esc>")










-- Terminal --

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "fj", [[<C-\><C-n>]],  { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])




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
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- <C-t> to jump back
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  -- vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

  -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  -- -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  -- -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  -- -- vim.keymap.set("n", "<leader>wl", function()
  -- --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- -- end, opts)

  vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

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
  nnoremap("<leader>ds", ts.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  nnoremap("<leader>ws", ts.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

  -- Opens a popup that displays documentation about the word under your cursor
  --  See `:help K` for why this keymap.
  nnoremap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  nnoremap("gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
end





-- Telescope keymaps - originally part of telescope.lua
function M.telescope_keymaps(builtin)
  -- find_files calls `rg --files --colour` as priority, see link for details.
  -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/__files.lua#L272
  -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
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

-- Fzflua keymaps
function M.fzflua_keymaps()
  -- Was trying to copy from here:
  -- https://www.reddit.com/r/neovim/comments/1c1id24/vscode_like_path_display_in_fzfluas_files_picker/
  -- but doesn't work for me due to my FzfLua profile stuffing it up somehow, they way it passes
  -- data to the remove nvim process.
  -- Can mimick the expected results on the cmd line with:
  -- fd --color=never --type f --hidden --exclude .git -x printf "{}: {/} {//}\n" | fzf --with-nth '3' --delimiter '\s' --tiebreak 'begin,index' --ansi
  -- local vs_code_style = function()
  --   local fd_cmd = string.format(
  --     [[fd --color=never --type f --hidden --follow --exclude .git -x printf "{}: {/} %s\n"]],
  --     require('fzf-lua.utils').ansi_codes.grey('{//}')
  --   )

  --   require('fzf-lua').files({
  --     cmd = fd_cmd,
  --     fzf_opts = {
  --       ["--ansi"] = true,
  --       ["--with-nth"] = "2..",
  --       ["--delimiter"] = "\\s",
  --       ["--tiebreak"] = "begin,index",
  --     },
  --     -- debug = true,
  --   })
  -- end

  -- nnoremap("<C-p>", vs_code_style, { desc = "Find files" })
  nnoremap("<C-p>", ":FzfLua files<CR>", { desc = "Find files" })
  nnoremap("<C-b>", ":FzfLua buffers<CR>", { desc = "Find buffers" })
  nnoremap("<leader>g", ":FzfLua grep<CR>", { desc = "Grep" })
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





function M.lazygit_keymaps()
  nnoremap("<leader>l", ":LazyGit<CR>", { desc = "LazyGit" })
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





-- WezTerm0move keymaps
function M.wezterm_move_keymaps(wm)
  nnoremap("<C-h>", function() wm.move("h") end, { desc = "Move WezTerm focus to the left window" })
  nnoremap("<C-j>", function() wm.move("j") end, { desc = "Move WezTerm focus to the lower window" })
  nnoremap("<C-k>", function() wm.move("k") end, { desc = "Move WezTerm focus to the upper window" })
  nnoremap("<C-l>", function() wm.move("l") end, { desc = "Move WezTerm focus to the right window" })

  nnoremap("<C-;>", function() wm.move("j") end, { desc = "Move WezTerm focus to the lower window" })
end


return M
