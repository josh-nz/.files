-- Require my vim config first so leader is
-- correctly mapped before any lazy config occurs.
require("user.vim-config")
require("user.lazy")

require("user.vertical_help")

-- require("user.keymaps")
-- require("user.keymaps_alt")
-- require("user.highlight_yank")
-- require("user.format_on_save")
-- require("user.toggle_eslint")
-- require("user.rotate_windows")
-- require("user.resize_windows")
-- require("user.edit_text")
-- require("user.toggle_diagnostics")

-- Hide all semantic highlights until upstream issues are resolved.
-- https://github.com/catppuccin/nvim/issues/480
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
