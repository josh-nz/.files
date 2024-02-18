-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/user/utils.lua
local M = {}

M.is_git_directory = function()
	local result = vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 and result:find("true") then
		return true
	else
		return false
	end
end

return M