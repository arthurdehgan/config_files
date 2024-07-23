-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"

config.font = wezterm.font("Liga SFMono Nerd Font", { weight = "Regular" })
config.font_size = 12

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 8
config.keys = {
	{ -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		key = "LeftArrow",
		mods = "CTRL",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{ -- Make Option-Right equivalent to Alt-f; forward-word
		key = "RightArrow",
		mods = "CTRL",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	{
		key = "q",
		mods = "ALT",
		action = wezterm.action.QuitApplication,
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
}
config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	border_bottom_height = "0",
}
config.window_close_confirmation = "AlwaysPrompt"

-- and finally, return the configuration to wezterm
return config
