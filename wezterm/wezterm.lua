local wezterm = require("wezterm")
return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 9.0,
	color_scheme = "MaterialDarker",

	colors = {
		tab_bar = {
			background = "#212121",

			active_tab = {
				bg_color = "#212121",
				fg_color = "#d9d9d9",

				intensity = "Bold",
			},

			inactive_tab = {
				bg_color = "#212121",
				fg_color = "#c0c0c0",
			},

			inactive_tab_hover = {
				bg_color = "#212121",
				fg_color = "#c0c0c0",

				italic = true,
			},

			new_tab = {
				bg_color = "#212121",
				fg_color = "#808080",
			},

			new_tab_hover = {
				bg_color = "#1a1a1a",
				fg_color = "#909090",
				italic = true,
			},
		},
	},
}
