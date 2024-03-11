-- https://github.com/kndndrj/nvim-dbee
return {
  "kndndrj/nvim-dbee",
  enabled = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup({
      -- sources = {
      --   require("dbee.sources").MemorySource:new({
      --     {
      --       name = "My db",
      --       type = "postres",
      --       url = "postgres://localhost/my_db",
      --     },
      --   })
      -- }
    })
  end,
}
