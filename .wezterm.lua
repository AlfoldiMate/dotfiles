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

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.tab_max_width = 30

config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"

config.window_background_opacity = 1
config.macos_window_background_blur = 40

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.use_resize_increments = true

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	font_size = 11.0,
	active_titlebar_bg = "#0F0F1E",
	inactive_titlebar_bg = "#0F0F1E",
	border_left_width = "1px",
	border_right_width = "1px",
	border_bottom_height = "1px",
	border_top_height = "0px",
	border_left_color = "#303030",
	border_right_color = "#303030",
	border_bottom_color = "#303030",
	border_top_color = "#303030",
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = "#808080",
		inactive_tab = {
			bg_color = "#0D0D22",
			fg_color = "#808080",
		},
		inactive_tab_hover = {
			bg_color = "#38394E",
			fg_color = "#94BCFE",
		},
		active_tab = {
			bg_color = "#19192A",
			fg_color = "#94BCFE",
		},
	},
}

return config
