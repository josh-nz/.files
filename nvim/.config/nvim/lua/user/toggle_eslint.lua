-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/toggle_eslint.lua
vim.api.nvim_create_user_command("ToggleESLint", function()
	require("null-ls").toggle("eslint")
end, {})