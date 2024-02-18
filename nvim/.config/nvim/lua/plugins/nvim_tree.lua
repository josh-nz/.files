-- https://github.com/nvim-tree/nvim-tree.lua
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	config = function()
		require("nvim-tree").setup()
		vim.keymap.set("n", "<leader>y", ":NvimTreeToggle<CR>")
	end,
}
