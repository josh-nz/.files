-- See `:help lua-guide-autocommands`


-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("user_highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/highlight_yank.lua
-- vim.api.nvim_create_autocmd("TextYankPost", {
--  group = vim.api.nvim_create_augroup("user_highlight_yank", { clear = true }),
--  pattern = "*",
--  desc = "Highlight selection on yank",
--  callback = function()
--    vim.highlight.on_yank({ timeout = 200, visual = true })
--  end,
-- })


-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/vertical_help.lua
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd("L")
    vim.cmd.wincmd("=")
  end,
})


-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/resize_windows.lua
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("user_window_resized", { clear = true }),
  pattern = "*",
  command = "wincmd =",
  desc = "Auto-resize windows on terminal buffer resize.",
})


-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/edit_text.lua
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("user_edit_text", { clear = true }),
  pattern = { "gitcommit", "markdown", "txt" },
  desc = "Enable spell checking and text wrapping for certain filetypes",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})


-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/format_on_save.lua
-- vim.api.nvim_create_autocmd("BufWritePre", {
--  group = vim.api.nvim_create_augroup("user_format_on_save", { clear = true }),
--  pattern = "*",
--  desc = "Run LSP formatting on a file on save",
--  callback = function()
--    if vim.fn.exists(":Format") > 0 then
--      vim.cmd.Format()
--    end
--  end,
-- })


