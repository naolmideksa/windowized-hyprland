# 🪟 Windowized Hyprland

> **A Complete Floating-First, KDE/Windows-Style Desktop Experience for Hyprland**  
> Powered by native C++ window minimization, smart snapping, custom traffic-light titlebars, Noctalia shell (top pill bar + dock), Quickshell lockscreen (Qylock), and Material You dynamic theming.

---

## 🌟 Highlights & Features (From A to Z)

### 1. 🪟 Floating-First Window Management
* **Universal Floating**: All applications open as free-floating windows (`class = ".*"` default floating rule), avoiding jarring tiling grids.
* **Intelligent Modals & Dialogs**: Auto-centered dialogs, file choosers, and authentication prompts.
* **Picture-in-Picture & Waydroid**: Built-in 16:9 aspect ratio locking and auto-resizing rules.

### 2. 📐 Contextual Window Snapping
* **KDE / Windows Quick-Tile**:
  - `Super + Left` / `Super + Right`: Snap half-screen left or right.
  - `Super + Up`: Maximize to full work area (or snap top-left/top-right if already tiled).
  - `Super + Down`: Restore from maximize, snap bottom, or minimize.
  - `Super + Alt + Arrow Keys`: Snap to 4 corners (top-left, top-right, bottom-left, bottom-right).
* **Titlebar Aware**: Snapping offsets dynamically compensate for the 28px titlebar height to guarantee pixel-perfect bounds.

### 3. 🚦 Custom Hyprbars Titlebars
* **Sleek Frameless Design**: 28px bar height, no cluttered window titles, clean traffic-light button dots.
* **Hover Symbols**: Solid minimalist circles that reveal action symbols (`✕`, `□`, `−`, `^`) on hover.
* **4-Button Layout**:
  - 🔴 **Red (Close)**: Closes the active window.
  - 🟢 **Green (Maximize / Restore)**: Toggles full-screen maximize; double-clicking anywhere on the titlebar also maximizes/restores.
  - 🟡 **Yellow (Minimize)**: In-process native minimization directly to the Noctalia dock.
  - 🔵 **Blue (Keep On Top)**: Pin window floating above all other windows with automatic C++ z-order raise enforcement.

### 4. ⚡ Kyprland Minimization Engine
* **Native C++ Hyprland Plugin**: Built directly into Hyprland compositor space (`kyprland.so`).
* **Zero Workspaces Switching**: Windows are hidden in-process without shuffling across dummy workspaces or warping your mouse cursor.
* **Show Desktop (`Super + D`)**: Instantly minimizes all visible windows to reveal your wallpaper, and restores them on second press.

### 5. 🏝️ Noctalia Floating Pill Top Bar
* **Pill Design**: Floating rounded bar with blur and shadow.
* **Widgets**:
  - Workspace indicator pill capsule.
  - Active window title.
  - Collapsible system monitor accordion (CPU usage, RAM usage, GPU temp).
  - Media player controls (auto-hides when idle).
  - Status tray, volume, network, brightness, and session controls.
* **Bar Toggle (`Super + B`)**: Instantly toggles between persistent reserved space and smart auto-hide.

### 6. ⚓ Noctalia Bottom Dock
* **macOS / KDE-Style Dock**: Autohiding dock positioned at the bottom with 67px high-resolution icons, active application dots, and running indicators.
* **Custom CachyOS Launcher Button**: Fast application menu and emoji picker (`Super + Space` or `Alt + Space`).

### 7. 🔒 Qylock (Quickshell Lockscreen)
* **Wayland Lockscreen**: Fast lockscreen built on Quickshell and SDDM `material-you-dark` theme.
* **Instant Lock**: Triggered via `Super + L` or `Ctrl + Alt + L`.
* **Integrated PAM Authentication**: Secure Wayland-native unlocking.

### 8. 🎨 Dynamic Wallpaper & Theming
* **Material 3 Tonal Spot Extraction**: Dynamic color palettes extracted directly from your wallpaper.
* **Wallpaper Selector (`Super + Shift + W`)**: Built-in Noctalia wallpaper panel to cycle wallpapers live.
* **Synchronized Ecosystem**: Wallpaper colors dynamically cascade into Kitty terminal, Qt6ct, GTK3/GTK4, and Noctalia widgets.

---

## ⌨️ Keybinding Reference

| Category | Shortcut | Action |
| :--- | :--- | :--- |
| **Window Controls** | `Alt + F4` / `Super + Q` | Close window |
| | `Super + Up` / `Super + Page_Up` | Maximize / Restore |
| | `Super + Down` / `Super + Page_Down` | Restore / Minimize |
| | `Super + M` | Toggle minimize active window |
| | `Super + Shift + M` | Restore last minimized window |
| | `Super + D` | Show Desktop (toggle minimize all) |
| | `F11` / `Super + F` | Fullscreen toggle |
| **Snapping** | `Super + Left` / `Super + Right` | Snap Half Left / Right |
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

## 🚀 Installation

### Automated Install (Arch Linux / CachyOS / EndeavourOS)

Clone this repository and run `install.sh`:

```bash
git clone https://github.com/naolmideksa/windowized-hyprland.git ~/windowized-hyprland
cd ~/windowized-hyprland
./install.sh
```

### What `install.sh` Does:
1. Verifies/installs required dependencies (`hyprland`, `noctalia`, `quickshell`, `kitty`, `qt6ct`, build tools).
2. Creates an automatic timestamped backup of your existing configs in `~/.config/windowized-hyprland-backup-<timestamp>`.
3. Deploys Hyprland, Noctalia, Qylock, Kitty, Qt6ct, and wallpaper configurations with your user paths dynamically set.
4. Compiles the native `hyprbars` and `kyprland` C++ plugins against your exact Hyprland compositor ABI.
5. Deploys the `material-you-dark` lockscreen theme and refreshes icon/desktop caches.
6. Hot-reloads Hyprland and Noctalia so the setup is immediately active.

---

## 📦 Stack & Dependencies

* **Compositor**: [Hyprland](https://hyprland.org/) (with Lua configuration support)
* **Shell & Dock**: [Noctalia](https://noctalia.dev)
* **Lockscreen**: [Quickshell](https://quickshell.outfoxxed.me/) + `material-you-dark`
* **Window Plugins**:
  - `hyprbars` (Customized with 4 hover-revealed traffic-light buttons & double-click maximize)
  - `kyprland` (Native C++ in-process window minimizer & keep-on-top manager)
* **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) (0.6 opacity, cursor trail, Noctalia theme)
* **File Manager**: Nautilus (configured for independent floating instances)
* **Theming**: Qt6ct + Adwaita Dark + Material You dynamic colors

---

## 📄 License

MIT License. Feel free to use, modify, and share!
