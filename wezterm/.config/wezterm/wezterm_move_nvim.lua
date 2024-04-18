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


local function find_vim_pane(tab)
  for _, pane in ipairs(tab:panes()) do
    if is_vim(pane) then
      return pane
    end
  end
end


-- Toggle zoom for neovim
local function split_or_zoom(wezterm)
  return {
    key = ";",
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
      local tab = window:active_tab()

      -- Open pane below if current pane is vim
      if is_vim(pane) then
        if (#tab:panes()) == 1 then
          -- Open pane below if when there is only one pane and it is vim
          pane:split({ direction = "Bottom" })
        else
          -- Send `CTRL-; to vim`, navigate to bottom pane from vim
          window:perform_action({
            SendKey = { key = ";", mods = "CTRL" },
          }, pane)
        end
        return
      end

      -- Zoom to vim pane if it exists
      local vim_pane = find_vim_pane(tab)
      if vim_pane then
        vim_pane:activate()
        tab:set_zoomed(true)
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

  -- This function behaves a bit goofy if there is
  -- already more than 1 split when NeoVim starts.
  -- Use the code as inspiration for something better.
  -- Another idea here:
  -- https://github.com/wez/wezterm/discussions/3779#discussioncomment-8923369
  table.insert(keys, split_or_zoom(wezterm))
end

return M
