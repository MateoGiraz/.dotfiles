local wezterm = require("wezterm")

local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():toggle_fullscreen()
end)

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Nord (Gogh)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 15

config.background = {
  {
    source = {
      File = "/Users/mateogiraz/Pictures/wallpaper.jpg"
    },
    hsb = {
      hue = 1.0,
      saturation = 1.02,
      brightness = 0.25,
    },
    width = "100%",
    height = "100%",
  },
  {
    source = {
      Color = "#282c35",
    },
    width = "100%",
    height = "100%",
    opacity = 0.55,
  },
}

return config
