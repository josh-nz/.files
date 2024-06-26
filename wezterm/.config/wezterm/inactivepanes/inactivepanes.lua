local M = {}

-- stylua: ignore
local variants = {
  "Default",
  { label = "Desaturated", value = { saturation = 0.1, brightness = 0.4, hue = 1 } },
  { label = "Slightly dimmed", value = { saturation = 0.7, brightness = 1, hue = 1 } },
}

M.init = function()
  return variants
end

M.activate = function(config, _, value)
  config.inactive_pane_hsb = value
end

return M
