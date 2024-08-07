-- Initial basis from: https://github.com/letieu/wezterm-move.nvim
-- Requires vim plugin to move from Neovim back to WezTerm:
-- https://github.com/letieu/wezterm-move.nvim
-- but I have modified this, see nvim/lua/user/wezterm_nvim_move.lua
-- Modified to be a function by myself.
-- Split or zoom taken from above Neovim plugin author's config:
-- https://github.com/letieu/dotfiles/blob/master/dot_config/wezterm/key.lua#L78
-- split_nav modified based on Folke's implementation:
-- https://github.com/folke/dot/blob/master/config/wezterm/keys.lua
-- Basis of the above links were taken from Neovim smart-splits plugin, which is
-- an alternative option to this, with more features:
-- https://github.com/mrjones2014/smart-splits.nvim

local wezterm = require("wezterm")

local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim")
end

local function split_nav(resize_or_move, mods, key, dir)
  return {
    key = key,
    mods = mods,
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({ SendKey = { key = key, mods = mods }, }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { dir, 10 } }, pane)
        else
          -- WezTerm cli cannot determine zoomed state, so while we can
          -- zoom the pane change to when moved from a WezTerm (terminal)
          -- pane, we can't do the same thing when moving from a Neovim pane.

          -- local is_zoomed = false
          -- local panes = pane:tab():panes_with_info()
          -- for _, p in ipairs(panes) do
          --   if p.is_zoomed then
          --     is_zoomed = true
          --   end
          -- end

          local next_pane = pane:tab():get_pane_direction(dir)
          if next_pane then
            win:perform_action({ ActivatePaneDirection = dir }, pane)
            -- win:perform_action({ SetPaneZoomState = is_zoomed }, pane)
          end

          -- wezterm.log_info("is_zoomed: " .. tostring(is_zoomed))
          -- if is_zoomed then
          --   dir = dir == "Up" or dir == "Right" and "Next" or "Prev"
          --   wezterm.log_info("dir: " .. dir)
          -- end
          -- win:perform_action({ ActivatePaneDirection = dir }, pane)
          -- win:perform_action({ SetPaneZoomState = is_zoomed }, pane)
        end
      end
    end),
  }
end

-- Toggle zoom for Neovim
local function split_or_zoom()
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
      for _, p in ipairs(tab:panes()) do
        if is_vim(p) then
          p:activate()
          tab:set_zoomed(true)
          return
        end
      end
    end),
  }
end


local M = {}
M.nav_keys = function(keys)
  -- Move between split panes
  table.insert(keys, split_nav("move", "CTRL", "h", "Left"))
  table.insert(keys, split_nav("move", "CTRL", "j", "Down"))
  table.insert(keys, split_nav("move", "CTRL", "k", "Up"))
  table.insert(keys, split_nav("move", "CTRL", "l", "Right"))

  table.insert(keys, split_nav("resize", "ALT", "h", "Left"))
  table.insert(keys, split_nav("resize", "ALT", "j", "Down"))
  table.insert(keys, split_nav("resize", "ALT", "k", "Up"))
  table.insert(keys, split_nav("resize", "ALT", "l", "Right"))

  -- This function behaves a bit goofy if there is
  -- already more than 1 split when Neovim starts.
  -- Use the code as inspiration for something better.
  -- Another idea here:
  -- https://github.com/wez/wezterm/discussions/3779#discussioncomment-8923369
  -- table.insert(keys, split_or_zoom(wezterm))
end

return M
