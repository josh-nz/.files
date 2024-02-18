-- https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	-- opts = {
	-- 	integrations = {
	-- 		cmp = true,
	-- 		gitsigns = true,
	-- 		harpoon = true,
	-- 		illuminate = true,
	-- 		indent_blankline = {
	-- 			enabled = true,
	-- 			scope_color = "sapphire",
	-- 			colored_indent_levels = true,
	-- 		},
	-- 		mason = true,
	-- 		native_lsp = { enabled = true },
	-- 		nvimtree = true,
	-- 		neotree = true,
	-- 		symbols_outline = true,
	-- 		telescope = true,
	-- 		treesitter = true,
	-- 		treesitter_context = true,
	-- 	},
	-- },
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
