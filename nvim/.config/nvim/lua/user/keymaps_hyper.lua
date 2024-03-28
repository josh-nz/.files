-- https://github.com/omerxx/dotfiles/blob/master/nvim/lua/keymaps.lua
-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
