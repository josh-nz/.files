-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- https://github.com/wez/wezterm/discussions/5435
local selector = require("config_selector")
local fonts = selector.new({ title = "Font selector", subdir = "fonts" })
local font_sizes = selector.new({ title = "Font size selector", subdir = "font_sizes" })
local colors = selector.new({ title = "Colorscheme selector", subdir = "colorschemes" })
local inactive_panes = selector.new({ title = "Inactive pane selector", subdir = "inactivepanes" })

fonts:select(config, "MonoLisa")
colors:select(config, "Catppuccin Mocha")
inactive_panes:select(config, "Slightly dimmed")
config.colors = {
  --split = "#777bdc"
  cursor_bg = "red",
  cursor_fg = "white",
}


config.font_size = 12.0


config.hide_tab_bar_if_only_one_tab = true

-- config.default_cwd = "~"


-- Distinguish between more key modifier combinations.
-- This allows Nvim to distinguish between C-k and C-S-k for example.
-- config.enable_csi_u_key_encoding = true
-- config.enable_kitty_keyboard = true


config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom('Clipboard'),
  },
}

local act = wezterm.action
config.keys = {
  -- { mods = 'CTRL', key = 'u', action = act.ScrollByPage(-1) },
  -- { mods = 'CTRL', key = 'd', action = act.ScrollByPage(1) },
  -- Unbind all the minimize/hide key bindings, except CMD m
  { mods = "CTRL", key = "M", action = act.DisableDefaultAssignment },
  { mods = "SHIFT|CTRL", key = "M", action = act.DisableDefaultAssignment },
  { mods = "SHIFT|CTRL", key = "m", action = act.DisableDefaultAssignment },
}

require("wezterm_move_nvim").nav_keys(wezterm, config.keys)

-- https://github.com/wez/wezterm/discussions/3733
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
-- https://wezfurlong.org/wezterm/config/lua/mux-events/mux-startup.html
wezterm.on("gui-startup", function(cmd)
  -- The cmd parameter will be a representation of the parameters you pass to wezterm start, or nil if you just launched wezterm
  local tab, left_pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()

  -- local right_pane = left_pane:split({ })

--   local scripts_pane = left_pane:split({ direction = "Bottom", size = 0.1, cwd = "~" })

  left_pane:activate()
end)

-- https://wezfurlong.org/wezterm/config/lua/config/launch_menu.html
-- config.launch_menu = {
--   {
--     -- Optional label to show in the launcher. If omitted, a label
--     -- is derived from the `args`
--     label = 'Name',
--     -- The argument array to spawn.  If omitted the default program
--     -- will be used as described in the documentation above
--     args = { 'cmd' },

--     -- You can specify an alternative current working directory;
--     -- if you don't specify one then a default based on the OSC 7
--     -- escape sequence will be used (see the Shell Integration
--     -- docs), falling back to the home directory.
--     cwd = "~"

--     -- You can override environment variables just for this command
--     -- by setting this here.  It has the same semantics as the main
--     -- set_environment_variables configuration option described above
--     -- set_environment_variables = { FOO = "bar" },
--   },
-- }

-- and finally, return the configuration to wezterm
return config
