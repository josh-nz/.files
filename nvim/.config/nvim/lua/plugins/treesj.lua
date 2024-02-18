-- https://github.com/Wansmer/treesj
return {
  'Wansmer/treesj',
  enabled = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- keys = { '<space>m', '<space>j', '<space>s' },
  config = function()
    require('treesj').setup({--[[ your config ]]})
  end,
}