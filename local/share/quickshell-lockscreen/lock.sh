#!/usr/bin/env bash

# Current directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set library paths
export QML2_IMPORT_PATH="$DIR/imports:$QML2_IMPORT_PATH"
export QML_XHR_ALLOW_FILE_READ=1

# Get session type
export XDG_SESSION_TYPE="${XDG_SESSION_TYPE:-$(loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type --value 2>/dev/null || echo wayland)}"

# User theme preference
# Get user theme
CONFIG_FILE="$HOME/.config/qylock/theme"
if [ -n "$1" ]; then
    export QS_THEME="$1"
elif [ -f "$CONFIG_FILE" ]; then
    export QS_THEME=$(cat "$CONFIG_FILE")
else
    export QS_THEME="material-you-dark"
fi

# Set theme path
if [ -d "$DIR/themes/$QS_THEME" ]; then
    export QS_THEME_PATH="$DIR/themes/$QS_THEME"
elif [ -d "$DIR/../sddm-themes/$QS_THEME" ]; then
    export QS_THEME_PATH="$DIR/../sddm-themes/$QS_THEME"
elif [ -d "$DIR/themes_link/$QS_THEME" ]; then
    export QS_THEME_PATH="$DIR/themes_link/$QS_THEME"
elif [ -d "/usr/share/sddm/themes/$QS_THEME" ]; then
    export QS_THEME_PATH="/usr/share/sddm/themes/$QS_THEME"
else
    export QS_THEME_PATH="$DIR/themes_link/$QS_THEME"
fi

echo "Locking with Quickshell using theme: $QS_THEME"
echo "Theme path: $QS_THEME_PATH"

# Process cleanup
killall -9 hyprlock swaylock wlogout 2>/dev/null || true

# Execute lock
exec quickshell -p "$DIR/lock_shell.qml"
