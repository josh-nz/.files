local wezterm = require("wezterm")
local M = {}

M.init = function()
  return {
    { label = "0xProto", value = "0xProto" },
    { label = "CascadiaCode", value = "Cascadia Code" },
    { label = "Commit", value = "CommitMono" },
    { label = "FiraCode", value = "Fira Code" },
    { label = "Geist", value = "Geist" },
    { label = "Hack", value = "Hack" },
    { label = "Hasklig", value = "Hasklig" },
    { label = "IBM Plex", value = "IBM Plex Mono" },
    { label = "Inconsolata", value = "Inconsolata" },
    { label = "JetBrains", value = "JetBrains Mono" },
    { label = "Maple", value = "Maple Mono" },
    { label = "Maple v6", value = "Maple Mono v6" },
    { label = "Meslo", value = "Meslo LG L" },
    { label = "MonoLisa", value = "MonoLisa" },
    { label = "San Francisco", value = "SF Mono" },
    { label = "SourceCodePro", value = "Source Code Pro" },



  }
end

M.activate = function(config, label, value)
  config.font = wezterm.font(value)

  if label == "CascadiaCode" then
    -- calt and ss01 is italic script variant.
    -- ss19 is slashed zero instead of dotted zero.
    config.harfbuzz_features = { "calt=1", "ss01=1", "ss19=1" }
  elseif label == "MonoLisa" then
    -- ss02 is the script variant.
    -- zero is slashed zero instead of dotted zero.
    -- liga set to zero disables ligatures.
    -- Ligatures will not be displayed in WezTerm if their colour and
    -- style etc are not consistent for all characters in the ligature.
    -- This can happen for example with syntax highlighting or terminal
    -- plugins. Other terminals, such as Kitty, don't seem to have this
    -- limit, but instead the ligature is rendered as a mixture of the
    -- different colours, styles, etc.
    -- https://github.com/wez/wezterm/issues/2331
    config.harfbuzz_features = { "ss02=1", "zero", } --"liga=0" }
    -- Test ligatures:
    -- != <!--
  else
    config.harfbuzz_features = {}
  end
end

return M


-- Different fonts example:
-- https://github.com/folke/dot/blob/cb1d6f956e0ef1848e57a57c1678d8635980d6c5/config/wezterm/wezterm.lua#L52
-- config.font = wezterm.font({ family = "Fira Code" })
-- config.bold_brightens_ansi_colors = true
-- config.font_rules = {
--   {
--     intensity = "Bold",
--     italic = true,
--     font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
--   },
--   {
--     italic = true,
--     intensity = "Half",
--     font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
--   },
--   {
--     italic = true,
--     intensity = "Normal",
--     font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
--   },
-- }
