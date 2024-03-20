-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
config.inactive_pane_hsb = { saturation = 0.1, brightness = 0.4, hue = 1 }
config.colors = {
  --split = "#777bdc"
}

-- config.default_cwd = "~"

-- config.font = wezterm.font('MesloLGL Nerd Font Mono')
config.font = wezterm.font('Hack Nerd Font Mono')
-- config.font = wezterm.font('0xProto Nerd Font Mono')
config.font_size = 12.0

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom('Clipboard'),
  },
}

-- local act = wezterm.action
-- config.keys = {
--   { mods = 'CTRL', key = 'u', action = act.ScrollByPage(-1) },
--   { mods = 'CTRL', key = 'd', action = act.ScrollByPage(1) },
-- }

-- https://github.com/wez/wezterm/discussions/3733
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
-- https://wezfurlong.org/wezterm/config/lua/mux-events/mux-startup.html
wezterm.on("gui-startup", function(cmd)
  -- The cmd parameter will be a representation of the parameters you pass to wezterm start, or nil if you just launched wezterm
  local tab, left_pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()

  local right_pane = left_pane:split({ })

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
