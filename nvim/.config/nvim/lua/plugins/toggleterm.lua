-- https://github.com/akinsho/toggleterm.nvim
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
    })
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    -- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
