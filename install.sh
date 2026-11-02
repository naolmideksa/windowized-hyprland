#!/usr/bin/env bash
# ==============================================================================
#  WINDOWIZED-HYPRLAND - Complete Floating-First Desktop Setup Installer
#  KDE/Windows-style window controls, native minimization, snapping,
#  quickshell lockscreen, floating pill top bar & autohiding dock.
# ==============================================================================

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config/windowized-hyprland-backup-$(date +%Y%m%d_%H%M%S)"

echo -e "${CYAN}${BOLD}"
echo "  ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗██╗███████╗███████╗██████╗ "
echo "  ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██║╚══███╔╝██╔════╝██╔══██╗"
echo "  ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║██║  ███╔╝ █████╗  ██║  ██║"
echo "  ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║██║ ███╔╝  ██╔══╝  ██║  ██║"
echo "  ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝██║███████╗███████╗██████╔╝"
echo "   ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝╚═════╝ "
echo "                 ~ Windowized Hyprland Desktop Environment ~                    "
echo -e "${NC}"

# 1. Distro & AUR Helper check
echo -e "${YELLOW}[1/6] Checking system environment...${NC}"
if ! command -v pacman &>/dev/null; then
    echo -e "${RED}Error: This setup is designed for Arch Linux / CachyOS / EndeavourOS.${NC}"
    exit 1
fi

AUR_HELPER=""
if command -v yay &>/dev/null; then
    AUR_HELPER="yay"
elif command -v paru &>/dev/null; then
    AUR_HELPER="paru"
else
    echo -e "${YELLOW}Installing yay AUR helper...${NC}"
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    (cd /tmp/yay-bin && makepkg -si --noconfirm)
    AUR_HELPER="yay"
fi

# 2. Dependencies
echo -e "${YELLOW}[2/6] Installing dependencies...${NC}"
PACKAGES=(
    # Core & Shell
    hyprland
    noctalia
    quickshell
    kitty
    nautilus
    swash
    xdg-desktop-portal-hyprland
    adw-gtk-theme
    adwaita-icon-theme
    adwaita-fonts
    qt6ct
    librsvg
    # Build dependencies for C++ plugins
    base-devel
    cmake
    make
    gcc
    pkg-config
    pixman
    libdrm
    libinput
    libudev0-shim
    wayland
    libxkbcommon
    lua
)

# Filter packages that exist before passing to AUR helper
$AUR_HELPER -S --needed --noconfirm "${PACKAGES[@]}" 2>/dev/null || {
    echo -e "${YELLOW}Installing core packages via pacman/yay...${NC}"
    $AUR_HELPER -S --needed --noconfirm hyprland noctalia quickshell kitty nautilus qt6ct cmake make gcc pkg-config
}

# 3. Backup existing configs
echo -e "${YELLOW}[3/6] Backing up existing configs to ${BACKUP_DIR}...${NC}"
mkdir -p "$BACKUP_DIR"
for cfg in hypr noctalia qylock kitty qt6ct; do
    if [ -d "$HOME/.config/$cfg" ]; then
        cp -r "$HOME/.config/$cfg" "$BACKUP_DIR/"
    fi
done
if [ -d "$HOME/.local/share/quickshell-lockscreen" ]; then
    cp -r "$HOME/.local/share/quickshell-lockscreen" "$BACKUP_DIR/"
fi
if [ -f "$HOME/.local/state/noctalia/settings.toml" ]; then
    mkdir -p "$BACKUP_DIR/state_noctalia"
    cp "$HOME/.local/state/noctalia/settings.toml" "$BACKUP_DIR/state_noctalia/"
fi

# 4. Deploy configurations & assets
echo -e "${YELLOW}[4/6] Deploying configs and wallpapers...${NC}"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/state/noctalia"
mkdir -p "$HOME/.local/share/quickshell-lockscreen"
mkdir -p "$HOME/.local/share/icons/hicolor/scalable/apps"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/Pictures"

# Copy configs
cp -r "$REPO_DIR/config/hypr" "$HOME/.config/"
cp -r "$REPO_DIR/config/noctalia" "$HOME/.config/"
cp -r "$REPO_DIR/config/qylock" "$HOME/.config/"
cp -r "$REPO_DIR/config/kitty" "$HOME/.config/"
cp -r "$REPO_DIR/config/qt6ct" "$HOME/.config/"
cp -f "$REPO_DIR/config/kdeglobals" "$HOME/.config/" 2>/dev/null || true

# Copy Noctalia state & substitute current user home
cp -f "$REPO_DIR/local/state/noctalia/settings.toml" "$HOME/.local/state/noctalia/"
sed -i "s|__HOME__|$HOME|g" "$HOME/.local/state/noctalia/settings.toml"

# Copy Quickshell lockscreen files
cp -r "$REPO_DIR/local/share/quickshell-lockscreen/"* "$HOME/.local/share/quickshell-lockscreen/"
chmod +x "$HOME/.local/share/quickshell-lockscreen/lock.sh"

# Install SDDM lockscreen theme if sudo available, otherwise link locally
if [ -d "/usr/share/sddm/themes" ] && sudo -n true 2>/dev/null; then
    sudo mkdir -p /usr/share/sddm/themes
    sudo cp -r "$REPO_DIR/local/share/sddm-themes/material-you-dark" /usr/share/sddm/themes/
fi

# Copy Icons & Applications
cp -rf "$REPO_DIR/local/share/icons/"* "$HOME/.local/share/icons/" 2>/dev/null || true
cp -rf "$REPO_DIR/local/share/applications/"* "$HOME/.local/share/applications/" 2>/dev/null || true

# Copy Wallpapers and custom icons to ~/Pictures
cp -f "$REPO_DIR/assets/wallpapers/"* "$HOME/Pictures/" 2>/dev/null || true

# Make scripts executable
chmod +x "$HOME/.config/hypr/scripts/"*.sh 2>/dev/null || true

# 5. Build/Verify Hyprland Plugins
echo -e "${YELLOW}[5/6] Compiling Hyprland plugins for your exact compositor ABI...${NC}"
HYPR_PLUGINS_DIR="$HOME/.config/hypr/plugins"

# Build hyprbars
if [ -d "$HYPR_PLUGINS_DIR/hyprbars" ]; then
    echo "Compiling hyprbars..."
    (cd "$HYPR_PLUGINS_DIR/hyprbars" && make clean 2>/dev/null || true && make all) && {
        cp -f "$HYPR_PLUGINS_DIR/hyprbars/hyprbars.so" "$HYPR_PLUGINS_DIR/hyprbars.so"
        echo -e "${GREEN}✓ hyprbars compiled successfully.${NC}"
    } || echo -e "${RED}Failed to compile hyprbars. Ensure hyprland headers are installed.${NC}"
fi

# Build kyprland
if [ -d "$HYPR_PLUGINS_DIR/kyprland" ]; then
    echo "Compiling kyprland (minimizer & keep-on-top engine)..."
    (cd "$HYPR_PLUGINS_DIR/kyprland" && make clean 2>/dev/null || true && make all) && {
        cp -f "$HYPR_PLUGINS_DIR/kyprland/kyprland.so" "$HYPR_PLUGINS_DIR/kyprland.so"
        echo -e "${GREEN}✓ kyprland compiled successfully.${NC}"
    } || echo -e "${RED}Failed to compile kyprland. Ensure hyprland headers are installed.${NC}"
fi

# 6. Refresh Caches & Reload
echo -e "${YELLOW}[6/6] Refreshing caches and reloading desktop...${NC}"
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor" 2>/dev/null || true

if command -v hyprctl &>/dev/null; then
    hyprctl reload config-only 2>/dev/null || true
fi

if command -v noctalia &>/dev/null; then
    noctalia msg config-reload 2>/dev/null || true
    noctalia msg dock-reload 2>/dev/null || true
fi

echo -e "\n${GREEN}${BOLD}✓ Installation Complete!${NC}"
echo -e "${CYAN}Features active:"
echo " - Universal Floating Windows & Contextual Snapping"
echo " - Hyprbars Traffic-Light Buttons (Close, Maximize, Native Minimize, Keep-On-Top)"
echo " - Qylock Quickshell Lockscreen (Material You Dark)"
echo " - Noctalia Floating Pill Top Bar & Smart Auto-Hiding Bottom Dock"
echo " - Material You Dynamic Wallpaper Theming"
echo " - Native In-Process Minimization (Kyprland Plugin)"
echo -e "${NC}\nEnjoy your windowized desktop experience! 🪟🚀"
