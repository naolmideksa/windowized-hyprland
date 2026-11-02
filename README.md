# 🪟 Windowized Hyprland — Floating-First Hyprland Dotfiles & Rice

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Wayland](https://img.shields.io/badge/Platform-Wayland-informational.svg)](https://wayland.freedesktop.org/)
[![Compositor: Hyprland](https://img.shields.io/badge/Compositor-Hyprland%200.56%2B-00aa84.svg)](https://hyprland.org/)
[![Shell: Noctalia](https://img.shields.io/badge/Shell-Noctalia-798bb2.svg)](https://noctalia.dev)
[![Lockscreen: Quickshell](https://img.shields.io/badge/Lockscreen-Quickshell%20Qylock-ed5454.svg)](https://quickshell.outfoxxed.me/)
[![Distro: Arch / CachyOS](https://img.shields.io/badge/Distro-Arch%20%7C%20CachyOS%20%7C%20EndeavourOS-1793d1.svg)](https://archlinux.org)

> **The ultimate floating-first desktop experience for Hyprland.**  
> Transform Hyprland from a strict dynamic tiling window manager into an intuitive, KDE Plasma / Windows / macOS-style floating desktop with native C++ window minimization, smart quarter & half snapping, custom traffic-light titlebars, Noctalia floating pill bar & bottom dock, Quickshell lockscreen (Qylock), and dynamic Material You wallpaper theming.

---

![Windowized Hyprland Floating Desktop Rice with Noctalia Dock and Top Bar](assets/wallpapers/vimal-s-GBg3jyGS-Ug-unsplash.jpg)

---

## 📑 Table of Contents

- [Why Windowized Hyprland?](#-why-windowized-hyprland)
- [Key Features (A to Z)](#-key-features-a-to-z)
  - [1. Universal Floating Windows](#1--universal-floating-windows)
  - [2. Contextual Window Snapping](#2--contextual-window-snapping)
  - [3. Custom Hyprbars Titlebars & Buttons](#3--custom-hyprbars-titlebars--buttons)
  - [4. Kyprland Native Minimization Engine](#4--kyprland-native-minimization-engine)
  - [5. Noctalia Floating Pill Top Bar](#5--noctalia-floating-pill-top-bar)
  - [6. Noctalia macOS-Style Bottom Dock](#6--noctalia-macos-style-bottom-dock)
  - [7. Qylock Quickshell Lockscreen](#7--qylock-quickshell-lockscreen)
  - [8. Material You Dynamic Wallpaper Theming](#8--material-you-dynamic-wallpaper-theming)
- [Keyboard & Mouse Shortcuts](#-keyboard--mouse-shortcuts)
- [Quick Installation](#-quick-installation)
- [Frequently Asked Questions (FAQ)](#-frequently-asked-questions-faq)
- [Technical Stack & Architecture](#-technical-stack--architecture)
- [Contributing & License](#-contributing--license)

---

## 💡 Why Windowized Hyprland?

Most Wayland window managers force strict automatic tiling grids that fight against creative apps, multi-window workflows, floating modals, and casual browsing. 

**Windowized Hyprland** solves this by providing:
* **The fluid animations and speed of Hyprland** paired with the effortless familiarity of a traditional floating desktop (like KDE Plasma 6 or Windows 11).
* **True in-process window minimization** via a custom C++ Hyprland plugin (`kyprland.so`) — no dummy workspace hopping or cursor warping.
* **Pixel-perfect quarter and half-screen snapping** that dynamically accounts for window titlebars and maintains 16:9 aspect ratios for video players and Waydroid.
* **A unified, modern desktop shell** powered by Noctalia and Quickshell with Material 3 dynamic color palettes.

---

## 🌟 Key Features (A to Z)

### 1. 🪟 Universal Floating Windows
* **Floating by Default**: Windows open at their natural requested dimensions (`class = ".*"` floating rule) instead of being shoehorned into small tiled slots.
* **Smart Modals**: File dialogs, credential prompts, Open/Save windows, and browser pickers automatically float and center.
* **Picture-in-Picture & Video Rules**: Browser PiP windows automatically remain floating with locked aspect ratios.

### 2. 📐 Contextual Window Snapping
* **KDE / Windows Quick-Tile**:
  - `Super + Left` / `Super + Right`: Snap half-screen left or right.
  - `Super + Up`: Maximize to full work area (or snap top-left/top-right if already tiled).
  - `Super + Down`: Restore from maximize, snap bottom, or minimize.
  - `Super + Alt + Arrow Keys`: Snap to 4 corners (top-left, top-right, bottom-left, bottom-right).
* **Titlebar Aware**: Offsets dynamically compensate for the 28px titlebar height to guarantee flush screen edges.
* **Aspect Ratio Preservation**: Automatically keeps 16:9 proportions for media players and Waydroid windows while snapping.

### 3. 🚦 Custom Hyprbars Titlebars & Buttons
* **Clean Frameless Aesthetics**: Sleek 28px bar height, no cluttered window titles, clean colored dots.
* **Hover Symbols**: Minimalist solid dots reveal function icons (`✕`, `□`, `−`, `^`) when your cursor hovers over them.
* **4-Button Traffic Light Layout**:
  - 🔴 **Red (Close)**: Closes the active window.
  - 🟢 **Green (Maximize / Restore)**: Toggles full-screen maximize; double-clicking anywhere on the titlebar also maximizes/restores.
  - 🟡 **Yellow (Minimize)**: In-process native minimization directly to the Noctalia dock.
  - 🔵 **Blue (Keep On Top)**: Pin window floating above all other windows with automatic C++ z-order raise enforcement.

### 4. ⚡ Kyprland Native Minimization Engine
* **Native C++ Hyprland Plugin**: Directly hooked into the Hyprland compositor runtime (`kyprland.so`).
* **Zero Workspaces Switching**: Windows are hidden in-process without shuffling across dummy workspaces or warping your mouse cursor.
* **Show Desktop (`Super + D`)**: Instantly minimizes all visible windows to reveal your wallpaper, and restores them on second press.

### 5. 🏝️ Noctalia Floating Pill Top Bar
* **Pill Design**: Floating rounded capsule bar with background blur, transparency, and drop shadow.
* **Live Widgets**:
  - Workspace indicator pill capsule.
  - Active window title.
  - Collapsible system monitor accordion (CPU usage, RAM usage, GPU temp).
  - Media player controls (auto-hides when idle).
  - Status tray, volume, network, brightness, and session controls.
* **Bar Toggle (`Super + B`)**: Instantly toggles between persistent reserved space and smart auto-hide.

### 6. ⚓ Noctalia macOS-Style Bottom Dock
* **Autohiding Bottom Dock**: 67px high-resolution app icons, running app dots, and active window indicators.
* **Custom CachyOS Launcher Button**: Fast application menu and emoji picker (`Super + Space` or `Alt + Space`).

### 7. 🔒 Qylock Quickshell Lockscreen
* **Wayland-Native Lockscreen**: Built on Quickshell and the SDDM `material-you-dark` theme.
* **Instant Lock**: Triggered via `Super + L` or `Ctrl + Alt + L`.
* **Integrated PAM Authentication**: Secure Wayland PAM authentication shim.

### 8. 🎨 Material You Dynamic Wallpaper Theming
* **Material 3 Tonal Spot Extraction**: Dynamic color palettes extracted directly from your wallpaper.
* **Wallpaper Selector (`Super + Shift + W`)**: Built-in Noctalia wallpaper panel to cycle wallpapers live.
* **Synchronized Ecosystem**: Wallpaper colors dynamically cascade into Kitty terminal, Qt6ct, GTK3/GTK4, and Noctalia widgets.

---

## ⌨️ Keyboard & Mouse Shortcuts

| Category | Shortcut | Action |
| :--- | :--- | :--- |
| **Window Controls** | `Alt + F4` / `Super + Q` | Close window |
| | `Super + Up` / `Super + Page_Up` | Maximize / Restore |
| | `Super + Down` / `Super + Page_Down` | Restore / Minimize |
| | `Super + M` | Toggle minimize active window |
| | `Super + Shift + M` | Restore last minimized window |
| | `Super + D` | Show Desktop (toggle minimize all) |
| | `F11` / `Super + F` | Fullscreen toggle |
| **Window Snapping** | `Super + Left` / `Super + Right` | Snap Half Left / Right |
| | `Super + Alt + Up/Right/Down/Left` | Snap Quarter Corners |
| | `Super + KP_Home/Prior/End/Next` | Keypad Quarter Corners |
| **Navigation & Apps** | `Super + Space` / `Alt + Space` | Application Launcher |
| | `Super + Period` | Emoji Picker |
| | `Super + W` / `Super + Tab` | Window Switcher / Overview |
| | `Super + Enter` | Terminal (Kitty) |
| | `Super + E` | File Manager (Nautilus) |
| | `Super + Shift + W` | Wallpaper Selector |
| | `Super + B` | Toggle Top Bar (Visible / Auto-Hide) |
| | `Super + L` / `Ctrl + Alt + L` | Lock Screen (Qylock) |
| | `Ctrl + Alt + Delete` | Power / Leave Menu |
| **Mouse Gestures** | `Super + Left Click + Drag` | Move floating window |
| | `Super + Right Click + Drag` | Resize floating window |
| | `Double Click Titlebar` | Maximize / Restore window |
| | `3-Finger Swipe Down` | Close window |
| | `3-Finger Swipe Up` | Fullscreen window |
| | `4-Finger Horizontal Swipe` | Switch workspace |

---

## 🚀 Quick Installation

### One-Line Automated Install (Arch Linux, CachyOS, EndeavourOS, Manjaro)

```bash
git clone https://github.com/naolmideksa/windowized-hyprland.git ~/windowized-hyprland
cd ~/windowized-hyprland
./install.sh
```

### What `install.sh` Does:
1. **Dependency Verification**: Installs required packages (`hyprland`, `noctalia`, `quickshell`, `kitty`, `qt6ct`, build dependencies).
2. **Safe Backup**: Automatically backs up any existing configurations to a timestamped directory: `~/.config/windowized-hyprland-backup-<timestamp>`.
3. **Configuration Deployment**: Deploys Hyprland, Noctalia, Qylock, Kitty, Qt6ct, and wallpapers with your user paths dynamically set.
4. **Plugin Compilation**: Compiles the native `hyprbars` and `kyprland` C++ plugins against your exact Hyprland compositor ABI.
5. **Theme & Lockscreen Setup**: Configures `material-you-dark` and updates system icon caches.
6. **Live Reload**: Reloads Hyprland and Noctalia so your new setup is active immediately.

---

## ❓ Frequently Asked Questions (FAQ)

### Can I make all windows float in Hyprland?
Yes! In Windowized Hyprland, `windowrules.lua` sets `hl.window_rule({ match = { class = ".*" }, float = true })`, making every application float by default just like in Windows, macOS, or KDE Plasma, while still supporting snapping and full maximization.

### How does window minimization work without workspace switching?
Standard Hyprland setups simulate minimization by sending windows to a "special workspace" or dummy workspace, which frequently breaks focus and cursor placement. Windowized Hyprland uses the native C++ `kyprland.so` plugin to hide and unmap windows in-process, retaining exact window positions, state, and dock integration.

### What Linux distributions are supported?
Windowized Hyprland is optimized for Arch Linux, CachyOS, EndeavourOS, and Manjaro using `pacman` and `yay`/`paru`. Any Wayland Linux distribution with Hyprland 0.50+ and Lua configuration support can run this setup.

### How do I switch wallpapers?
Press `Super + Shift + W` to open the Noctalia wallpaper selector panel. Select any wallpaper to instantly apply it and re-generate the dynamic Material 3 color palette across your desktop.

---

## 📦 Technical Stack & Architecture

* **Compositor**: [Hyprland](https://hyprland.org/) (Lua configuration engine)
* **Desktop Shell**: [Noctalia](https://noctalia.dev) (Top pill bar & macOS-style bottom dock)
* **Lockscreen**: [Quickshell](https://quickshell.outfoxxed.me/) + `material-you-dark` SDDM theme
* **Window Plugins**:
  - `hyprbars`: Customized with 4 hover-revealed traffic-light buttons & double-click maximize
  - `kyprland`: Custom C++ compositor plugin for in-process minimization and keep-on-top management
* **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) (0.6 opacity, cursor trails, padding, Noctalia theme)
* **File Manager**: Nautilus (configured for independent floating instances)
* **Theming**: Qt6ct + Adwaita Dark + Material You dynamic colors

---

## 🤝 Contributing & License

Contributions, issues, and feature requests are welcome!  
Feel free to open an issue or submit a pull request on [GitHub](https://github.com/naolmideksa/windowized-hyprland).

Released under the [MIT License](LICENSE).

---

*Tags: hyprland, hyprland-dotfiles, hyprland-rice, floating-wm, wayland, hyprbars, noctalia, quickshell, cachyos, arch-linux, window-snapping, kde-plasma, material-you, desktop-environment, linux-desktop.*
