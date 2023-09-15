local wezterm_status, wezterm = pcall(require, "wezterm")

if not wezterm_status then
	return
end

local config = {}

-- for newer version of wezterm
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- configuration
config.color_scheme = "Afterglow"
config.window_frame = {
	font = wezterm.font({ family = "Hack", weight = "Bold" }),
	font_size = 12.0,
}
config.font = wezterm.font_with_fallback({ "Hack", "JetBrains Mono" })
config.font_size = 11.5

-- return config to wezterm
return config
