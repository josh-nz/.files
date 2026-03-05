vim.wo.wrap = true -- Wrap text
vim.wo.breakindent = true -- Match indent on line break
vim.wo.linebreak = true -- Line break on whole words

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })

-- Spell check
vim.wo.spell = true
