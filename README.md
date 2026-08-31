# Everforest Organic

This is Everforest Organic. A cool, but organic, mid-century modern theme for your Omarchy setup on Arch and Hyprland.

<img width="1600" height="900" alt="screenshot-2026-03-25_06-35-12" src="https://github.com/user-attachments/assets/9aefc179-434e-46a3-a883-5eda66e57e24" />

## Requires Omarchy 4 (Quattro)

This theme targets Omarchy 4.x. Quattro replaced waybar, walker, mako, swayosd
and hyprlock with a single Quickshell process, moved Hyprland config to Lua, and
expanded the theme palette from 8 colors to 24 named roles — so the 3.x version
of this theme does not render correctly on 4.x, and this version does not work
on 3.x. The last 3.x-compatible commit is tagged `omarchy-3.x`.

What lives where now:

| Look | File |
|---|---|
| Palette (shell, terminals, btop, helix, vscode) | `colors.toml` |
| Rounded corners, blur, shadows, gaps, animations | `hyprland.lua` |
| See-through bar, menus, notifications, lock screen | `shell.toml` |
| Terminal opacity + padding | `alacritty.toml`, `ghostty.conf`, `kitty.conf` |

## Installing

```bash
omarchy theme install https://github.com/Captaintt2731/everforest-organic
omarchy theme set everforest-organic
```

### ⚠️ Installing this way drops the rounded/organic window shape

`omarchy theme set` refuses to stage anything that runs code from a theme that
was cloned from a repo — every `*.lua`, plus `alacritty.toml`, `foot.ini`,
`ghostty.conf`, `kitty.conf` and `vscode.json`. That is deliberate Omarchy
security policy, not a bug in this theme. Installed the command above, you get
the palette and the see-through shell, but **not** `hyprland.lua` (rounding,
blur, shadows, animations) and **not** the translucent terminals.

To get the whole theme, clone it yourself and symlink it in — Omarchy treats a
symlinked theme directory as your own, and applies all of it:

```bash
git clone https://github.com/Captaintt2731/everforest-organic ~/src/everforest-organic
ln -s ~/src/everforest-organic ~/.config/omarchy/themes/everforest-organic
omarchy theme set everforest-organic
```

Or, if you'd rather not symlink, copy the window-shape settings out of
`hyprland.lua` into your own `~/.config/hypr/looknfeel.lua`, which is loaded
after the theme and is never restricted.
