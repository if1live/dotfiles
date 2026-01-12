-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 128
config.initial_rows = 28
config.font_size = 11
config.color_scheme = 'Material Darker (base16)'

-- bash configuration
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }

-- 비프음(소리) 끄기
config.audible_bell = "Disabled"

-- and finally, return the configuration to wezterm
return config
