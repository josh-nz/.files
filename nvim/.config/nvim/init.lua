-- Require my vim config first so leader is
-- correctly mapped before any lazy config occurs.
require("user.vim-config")

require("user.lazy")

require("user.keymaps")
require("user.auto_commands")
require("user.user_commands")


-- Hide all semantic highlights until upstream issues are resolved.
-- https://github.com/catppuccin/nvim/issues/480
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
