-- https://github.com/rebelot/terminal.nvim
return {
  "rebelot/terminal.nvim",
  enabled = false,
  config = function()
    require("terminal").setup()
    local term_map = require("terminal.mappings")
    vim.keymap.set({ "n", "x" }, "<leader>ms", term_map.operator_send, { expr = true })
    vim.keymap.set("n", "<leader>mo", term_map.toggle)
    vim.keymap.set("n", "<leader>mO", term_map.toggle({ open_cmd = "enew" }))
    vim.keymap.set("n", "<leader>mr", term_map.run)
    vim.keymap.set("n", "<leader>mR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
    vim.keymap.set("n", "<leader>mk", term_map.kill)
    vim.keymap.set("n", "<leader>m]", term_map.cycle_next)
    vim.keymap.set("n", "<leader>m[", term_map.cycle_prev)
    vim.keymap.set("n", "<leader>ml", term_map.move({ open_cmd = "belowright vnew" }))
    vim.keymap.set("n", "<leader>mL", term_map.move({ open_cmd = "botright vnew" }))
    vim.keymap.set("n", "<leader>mh", term_map.move({ open_cmd = "belowright new" }))
    vim.keymap.set("n", "<leader>mH", term_map.move({ open_cmd = "botright new" }))
    vim.keymap.set("n", "<leader>mf", term_map.move({ open_cmd = "float" }))
  end,
}
