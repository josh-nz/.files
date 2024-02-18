-- https://github.com/nvim-lualine/lualine.nvim
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 
		"nvim-tree/nvim-web-devicons",
		-- https://github.com/ThePrimeagen/harpoon
		-- "ThePrimeagen/harpoon",
	},
	event = "VeryLazy",
	config = function()
		-- Doesn't work with Harpoon 2 as API is very different.
		-- local harpoon = require("harpoon.list")

		-- local function harpoon_component()
		-- 	local total_marks = harpoon.get_length()

		-- 	if total_marks == 0 then
		-- 		return ""
		-- 	end

		-- 	local current_mark = "—"

		-- 	local mark_idx = harpoon.get_current_index()
		-- 	if mark_idx ~= nil then
		-- 		current_mark = tostring(mark_idx)
		-- 	end

		-- 	return string.format("󱡅 %s/%d", current_mark, total_marks)
		-- end

		require("lualine").setup({
			theme = "dracula",	-- "auto"
			sections = {
				lualine_b = {
					"branch",
					-- harpoon_component,
					"diff",
					"diagnostics",
				},
				-- lualine_c = {
				-- 	{ "filename", path = 1 },
				-- },
				-- lualine_x = {
				-- 	"filetype",
				-- },
			},
		})
	end,
}
