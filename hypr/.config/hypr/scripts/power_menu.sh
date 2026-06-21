#!/bin/bash
CHOICE=$(echo -e "⏻ Apagar\n↺ Reiniciar\n⏾ Suspender\n⇢ Cerrar sesión" | wofi --dmenu --prompt "Power" --width 200 --height 180 --lines 4 --style ~/.config/wofi/power.css --allow-clicks)

case $CHOICE in
    "⏻ Apagar") systemctl poweroff ;;
    "↺ Reiniciar") systemctl reboot ;;
    "⏾ Suspender") systemctl suspend ;;
    "⇢ Cerrar sesión") hyprctl dispatch exit ;;
esac
