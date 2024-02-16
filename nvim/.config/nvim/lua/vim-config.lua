-- Make sure to set `mapleader` before lazy
-- plugin manager init so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.cursorline = true
-- vim.opt.autoread = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- vim.opt.shiftround = true

--vim.opt.termguicolours = true -- enable 24-bit colour

vim.opt.number = true -- Show line numbers.

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
