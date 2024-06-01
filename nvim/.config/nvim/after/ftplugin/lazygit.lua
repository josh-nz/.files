-- Reset Esc so it functions correctly inside LazyGit, otherwise my terminal
-- binding will leave insert mode back to normal mode, instead of LazyGit handling the Esc.
vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = true, silent = true, noremap = true })
