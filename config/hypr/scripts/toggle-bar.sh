#!/bin/sh
# Toggle Noctalia top bar between:
# 1) Always visible + reserve space
# 2) Smart auto-hide + no reserve space

if hyprctl monitors | grep -q "reserved: [0-9]* [1-9]"; then
    noctalia msg bar-auto-hide-set smart default
    noctalia msg bar-reserve-toggle default
else
    noctalia msg bar-auto-hide-set off default
    noctalia msg bar-reserve-toggle default
fi
