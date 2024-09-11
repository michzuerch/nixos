local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Batman"
config.enable_wayland = false
config.front_end = "WebGpu"

return config
