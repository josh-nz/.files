local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap


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
nnoremap("<M-h>", "<C-w>h")
nnoremap("<M-j>", "<C-w>j")
nnoremap("<M-k>", "<C-w>k")
nnoremap("<M-l>", "<C-w>l")
nnoremap("<M-Tab>", "<C-6>")
--  See `:help wincmd` for a list of all window commands
-- nnoremap("<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- nnoremap("<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- nnoremap("<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- nnoremap("<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- TIP: Disable arrow keys in normal mode
-- nnoremap("<left>", "<cmd>echo \"Use h to move!!\"<CR>")
-- nnoremap("<right>", "<cmd>echo \"Use l to move!!\"<CR>")
-- nnoremap("<up>", "<cmd>echo \"Use k to move!!\"<CR>")
-- nnoremap("<down>", "<cmd>echo \"Use j to move!!\"<CR>")


-- Turn off highlighted results
nnoremap("<Esc>", ":nohlsearch<CR>", { desc = "No search highlight" })

-- Send replaced char to black hole clip buffer instead of putting it in main clip buffer
nnoremap("x", '"_x')

-- Press 'U' for redo
-- nnoremap("U", "<C-r>")

nnoremap("<leader>l", ":LazyGit<CR>", { desc = "LazyGit" })


-- Insert --
-- Map jj to <esc>
inoremap("df", "<Esc>")
inoremap("fd", "<Esc>")
inoremap("fj", "<Esc>")
inoremap("jf", "<Esc>")
inoremap("jk", "<Esc>")
inoremap("kj", "<Esc>")




-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<Space>", "<nop>")










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
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
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
    builtin.colorscheme({ enable_preview = true })
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

return M
