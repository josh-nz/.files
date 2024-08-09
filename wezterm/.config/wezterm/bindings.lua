local wezterm = require("wezterm")
local M = {}

-- Taken from https://github.com/folke/dot/blob/master/config/wezterm/keys.lua
local smart_split = wezterm.action_callback(function(window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
  else
    window:perform_action(wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
  end
end)

function M.setup(config, pickers)
  config.mouse_bindings = {
    {
      event = { Down = { streak = 1, button = "Right" } },
      mods = "NONE",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
  }

  config.disable_default_key_bindings = true
  -- If clearing defaults, it's recommended to at least bind these two:
  -- config.keys = {
  --   { mods = 'CTRL', key = 'P', action = wezterm.action.ActivateCommandPalette },
  --   { mods = 'CTRL', key = 'L', action = wezterm.action.ShowDebugOverlay },
  -- }

  config.leader = { mods = "SUPER", key = "o", timeout_milliseconds = 1000 }

  -- Dump key bindings: wezterm show-keys --lua
  local default_keys = require("default_keys")
  config.key_tables = default_keys.key_tables

  local keymaps = default_keys.keys

  local kmod = {
    c = "CTRL",
    s = "SHIFT",
    a = "ALT",
    l = "LEADER",
    p = "SUPER",
  }

  local act = wezterm.action
  local custom_keys = {
    { mods = kmod.p, key = "l", action = act.ShowDebugOverlay },
    { mods = kmod.p, key = "p", action = act.ActivateCommandPalette },
    { mods = kmod.p, key = "z", action = act.TogglePaneZoomState },
    { mods = kmod.p, key = "Enter", action = act.TogglePaneZoomState },
    { mods = kmod.p, key = "\\", action = smart_split },

    { mods = kmod.l, key = "c", action = pickers.colors:selector_action() },
    { mods = kmod.l, key = "f", action = pickers.fonts:selector_action() },
    { mods = kmod.l, key = "i", action = pickers.inactive_panes:selector_action() },
    { mods = kmod.l, key = "s", action = pickers.font_sizes:selector_action() },
  }

  for _, v in ipairs(custom_keys) do
    table.insert(keymaps, v)
  end

  require("wezterm_nvim_move").nav_keys(keymaps)

  config.keys = keymaps
end

return M
