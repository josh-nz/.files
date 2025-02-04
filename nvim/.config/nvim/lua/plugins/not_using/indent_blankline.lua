-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "BufEnter",
  main = "ibl",
  opts = {}
}

-- Via reddit:
-- blankline.nvim replaced with the following:

-- vim.o.list = true
-- vim.opt.listchars = {leadmultispace = "│ "}
