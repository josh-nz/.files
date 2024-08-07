-- Original taken from https://github.com/letieu/wezterm-move.nvim
-- but modified to check if a pane exists in the movement direction
-- first. This prevents a zoomed pane from unzooming when there is
-- no pane to move to.

local function wezterm_exec(cmd)
  local command = vim.deepcopy(cmd)
  table.insert(command, 1, "wezterm")
  table.insert(command, 2, "cli")
  return vim.fn.system(command)
end

-- @param direction: string (h, j, k, l)
local function wezterm_change_pane(direction)
  local wezterm_directions = { h = "Left", j = "Down", k = "Up", l = "Right" }
  local dir = wezterm_directions[direction]
  local next_pane = wezterm_exec({ "get-pane-direction", dir })
  if next_pane ~= "" then
    wezterm_exec({ "activate-pane-direction", dir })
  end
end

-- @param direction: string (h, j, k, l)
local move = function(direction)
  if vim.fn.winnr() == vim.fn.winnr(direction) then -- At edge of nvim.
    wezterm_change_pane(direction)
  else
    vim.cmd.wincmd(direction)
  end
end

require("user.keymaps").wezterm_nvim_move_keymaps(move)
