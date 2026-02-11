-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrains Mono", { weight = "DemiBold", italic = false })
config.font_size = 13

config.color_scheme = "Catppuccin Mocha"

config.initial_cols = 120
config.initial_rows = 28
-- config.enable_tab_bar = false
--
--
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 30

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"

config.window_background_opacity = 1 -- 0.85
config.macos_window_background_blur = 40

config.window_padding = {
	left = 5,
	right = 5,
	top = 36,
	bottom = 0,
}

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
