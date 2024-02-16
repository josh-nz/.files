-- https://github.com/nvimtools/none-ls.nvim
return {
	"nvimtools/none-ls.nvim",
  enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Some of these require external tools, and need to be installed via :Mason.
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.mix,
        --null_ls.builtins.diagnostics.credo,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
