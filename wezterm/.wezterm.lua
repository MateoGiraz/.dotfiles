local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE", 
  default_cursor_style = "BlinkingBar",
  color_scheme = "Nord (Gogh)",
  font = wezterm.font("JetBrains Mono"),
  font_size = 15,
  keys = {
    {key="v", mods="CTRL", action=wezterm.action{PasteFrom="Clipboard"}},
    {key="c", mods="CTRL", action=wezterm.action{CopyTo="Clipboard"}},
    {key = 'f', mods = 'SHIFT|CTRL', action = wezterm.action.ToggleFullScreen},
  },
  background = {
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
  },
}

return config
