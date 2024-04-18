-- Initial basis from: https://github.com/letieu/wezterm-move.nvim
-- Requires vim plugin to move from NeoVim back to WezTerm:
-- https://github.com/letieu/wezterm-move.nvim
-- Modified to be a function by myself.
-- Split or zoom taken from above NeoVim plugin author's config:
-- https://github.com/letieu/dotfiles/blob/master/dot_config/wezterm/key.lua#L78
-- Basis of the above links were taken from NeoVim smart-splits plugin, which is
-- an alternative option to this, with more features:
-- https://github.com/mrjones2014/smart-splits.nvim

local function is_vim(pane)
  local process_info = pane:get_foreground_process_info()
  local process_name = process_info and process_info.name

  return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(resize_or_move, key, wezterm)
  return {
    key = key,
    mods = resize_or_move == "resize" and "META" or "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
        }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end


local M = {}
M.nav_keys = function(wezterm, keys)
  -- move between split panes
  table.insert(keys, split_nav("move", "h", wezterm))
  table.insert(keys, split_nav("move", "j", wezterm))
  table.insert(keys, split_nav("move", "k", wezterm))
  table.insert(keys, split_nav("move", "l", wezterm))

  -- resize panes
  table.insert(keys, split_nav("resize", "h", wezterm))
  table.insert(keys, split_nav("resize", "j", wezterm))
  table.insert(keys, split_nav("resize", "k", wezterm))
  table.insert(keys, split_nav("resize", "l", wezterm))
end

return M
