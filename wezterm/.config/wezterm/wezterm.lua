-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- https://github.com/wez/wezterm/discussions/5435
-- alternative picker impl along with more WezTerm customizations:
-- https://github.com/sravioli/wezterm
local selector = require("config_selector")
local pickers = {
  fonts = selector.new({ title = "Font selector", subdir = "fonts" }),
  font_sizes = selector.new({ title = "Font size selector", subdir = "font_sizes" }),
  colors = selector.new({ title = "Colorscheme selector", subdir = "colorschemes" }),
  inactive_panes = selector.new({ title = "Inactive pane selector", subdir = "inactivepanes" }),
}

pickers.fonts:select(config, "MonoLisa")
config.font_size = 11.0

-- https://github.com/wez/wezterm/issues/3774
-- config.front_end = 'OpenGL'
-- config.front_end = 'WebGPU'
-- config.freetype_load_target = 'Light'
-- config.freetype_load_target = 'VerticalLcd'
-- config.freetype_load_flags = 'NO_BITMAP'
-- config.freetype_render_target = 'HorizontalLcd'
-- config.font = wezterm.font("MonoLisa", { weight = "Medium" })

-- fonts:select(config, "CascadiaCode")
-- config.font_size = 13.0

pickers.colors:select(config, "Catppuccin Mocha")
pickers.inactive_panes:select(config, "Slightly dimmed")


config.colors = {
  -- split = "#777bdc",
  cursor_bg = "red",
  cursor_fg = "white",
}


config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}


-- config.default_cwd = "~"


-- Distinguish between more key modifier combinations.
-- This allows Nvim to distinguish between C-k and C-S-k for example.
-- https://wezfurlong.org/wezterm/config/key-encoding.html
-- config.enable_csi_u_key_encoding = true  -- Not recommended according to docs.
config.enable_kitty_keyboard = true


-- Setup key and mouse bindings.
require("bindings").setup(config, pickers)


-- https://github.com/wez/wezterm/discussions/3733
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
-- https://wezfurlong.org/wezterm/config/lua/mux-events/mux-startup.html
wezterm.on("gui-startup", function(cmd)
  -- The cmd parameter will be a representation of the parameters you pass to wezterm start, or nil if you just launched wezterm
  local tab, left_pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()

  -- local right_pane = left_pane:split({ })

  -- local scripts_pane = left_pane:split({ direction = "Bottom", size = 0.1, cwd = "~" })

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
