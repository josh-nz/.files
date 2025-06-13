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

-- https://www.reddit.com/r/neovim/comments/1l9l4q0/i_cannot_live_without_this_plugin/
M.toggle_word = function()
	local toggles = {
		["true"] = "false",
		["always"] = "never",
		["yes"] = "no",
		-- ...
	}

	local cword = vim.fn.expand("<cword>")
	local newWord
	for word, opposite in pairs(toggles) do
		if cword == word then newWord = opposite end
		if cword == opposite then newWord = word end
	end
	if newWord then
		local prevCursor = vim.api.nvim_win_get_cursor(0)
		vim.cmd.normal { '"_ciw' .. newWord, bang = true }
		vim.api.nvim_win_set_cursor(0, prevCursor)
	end
end

return M
