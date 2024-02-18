-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/resize_windows.lua
vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("WinResize", { clear = true }),
	pattern = "*",
	command = "wincmd =",
	desc = "Auto-resize windows on terminal buffer resize.",
})