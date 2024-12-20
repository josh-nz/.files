-- Require my vim config first so leader is
-- correctly mapped before any lazy config occurs.
require("user.vim_config")

require("user.lazy")

-- https://vimcolorschemes.com

-- Some themes might set the background automatically,
-- others might require it to be explicitly set. Some
-- will determine the light/dark variant based on the
-- background setting. Probably best to default to
-- setting it explicitly.
-- :h 'background'

-- vim.o.background = "light"
vim.o.background = "dark"
-- When changing colorscheme:
-- - Set `lazy = true,` in the current colorscheme file
-- - Set `lazy = false,` in the new colorscheme file
-- This will help maximise Neovim startup while also
-- ensuring that the desired colorscheme is loaded
-- first for correct colours.
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine-moon")
-- vim.cmd.colorscheme("nordic")
-- vim.cmd.colorscheme("blue")
-- vim.cmd.colorscheme("evergarden")
-- vim.cmd.colorscheme("darkvoid")
-- vim.cmd.colorscheme("serene")
vim.cmd.colorscheme("eidolon")

-- vim.api.nvim_set_hl(0, "Comment", { italic = true })

require("user.keymaps")
require("user.auto_commands")
require("user.user_commands")

require("user.wezterm_nvim_move")

-- Hide all semantic highlights until upstream issues are resolved.
-- https://github.com/catppuccin/nvim/issues/480
-- https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--   vim.api.nvim_set_hl(0, group, {})
-- end

