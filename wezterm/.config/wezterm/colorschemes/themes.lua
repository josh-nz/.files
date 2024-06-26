local M = {}

-- stylua: ignore
local colorschemes = {
  -- Themes that come with WezTerm:
  { label = "Ayu Dark", value = "Ayu Dark (Gogh)" },
  { label = "Tokyo Night Moon", value = "Tokyo Night Moon"},
  { label = "Catppuccin Mocha", value = "Catppuccin Mocha"},
  { label = "Kanagawa", value = "Kanagawa (Gogh)" },
  { label = "Kasugano", value = "Kasugano (terminal.sexy)" },

  -- Themes added to `colors` folder:
  { label = "Eldritch", value = "Eldritch" },
}

M.init = function()
  return colorschemes
end

M.activate = function(config, _, value)
  config.color_scheme = value
end

return M
