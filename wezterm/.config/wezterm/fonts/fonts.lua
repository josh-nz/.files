local wezterm = require("wezterm")
local M = {}

M.init = function()
  return {
    { label = "0xProto", value = "0xProto Nerd Font Mono" },
    { label = "FiraCode", value = "FiraMono Nerd Font Mono" },
    { label = "Hack", value = "Hack Nerd Font Mono" },
    { label = "Hasklig", value = "Hasklug Nerd Font Mono" },
    { label = "Inconsolata", value = "Inconsolata Nerd Font Mono" },
    { label = "JetBrains", value = "JetBrainsMono Nerd Font Mono" },
    { label = "SourceCodePro", value = "SauceCodePro Nerd Font Mono" },
    { label = "Meslo", value = "MesloLGL Nerd Font Mono" },
    { label = "CascadiaCode", value = "Cascadia Code NF" },

    { label = "Commit", value = "CommitMono" },
    { label = "Geist", value = "Geist Mono" },
    { label = "IBM Plex", value = "IBM Plex Mono" },
    { label = "MonoLisa Trial", value = "MonoLisa Trial" },
    { label = "San Francisco", value = "SF Mono" },
  }
end

M.activate = function(config, label, value)
  config.font = wezterm.font(value)

  if label == "CascadiaCode" then
    -- ss01 is italic script variant.
    -- ss19 is slashed zero instead of dotted zero.
    config.harfbuzz_features = { "calt=1", "ss01=1", "ss19=1" }
  else
    config.harfbuzz_features = {}
  end
  -- config.harfbuzz_features = { "ss02=1" }
  -- config.font = wezterm.font(
  -- {{
  --     family = 'MonoLisa Trial',
  --     -- https://wezfurlong.org/wezterm/config/font-shaping.html#advanced-font-shaping-options
  --     harfbuzz_features = { 'zero' },
  -- }})
end

return M
