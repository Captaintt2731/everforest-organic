-- Everforest Organic — soft, rounded, see-through window chrome.
--
-- Ported from the Omarchy 3.x hyprland.conf. Quattro configures Hyprland in
-- Lua, so a theme ships hyprland.lua and calls hl.config / hl.curve /
-- hl.animation. Loaded by default/hypr/omarchy.lua, before the user's own
-- ~/.config/hypr/looknfeel.lua — so anything set there still wins.

local active_border_color = { colors = { "rgba(7fbbb3de)", "rgba(c387d6de)" }, angle = 45 }
local inactive_border_color = "rgba(7fbbb340)"

hl.config({
  general = {
    layout = "dwindle",
    gaps_in = 10,
    gaps_out = 20,
    border_size = 3,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    -- rounding_power > 2 gives squircle corners rather than circular ones,
    -- which is what makes the shape read as organic rather than just rounded.
    rounding = 16,
    rounding_power = 4,
    dim_special = 0.0,

    shadow = {
      enabled = true,
      range = 16,
      render_power = 3,
      color = "rgba(0a0c1280)",
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 3,
      new_optimizations = true,
      xray = false,
      contrast = 0.8,
      brightness = 0.5,
      noise = 0.2,
      -- vibrancy is a 0.0–1.0 float. The 3.x config said 80, which was out of
      -- range and got clamped; 0.8 is the nearest deliberate value.
      vibrancy = 0.8,
      vibrancy_darkness = 0.0,
      special = true,
    },
  },
})

-- Organic motion: a soft overshoot curve on window movement.
hl.curve("wind", { type = "bezier", points = { { 0.02, 0.9 }, { 0.1, 1.03 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "wind" })
