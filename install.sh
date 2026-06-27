#!/bin/bash
set -e

echo "==> Instalando prerequisitos..."
sudo pacman -S --needed git stow

echo "==> Instalando paquetes oficiales..."
sudo pacman -S --needed - < packages.txt

if [ -s packages-aur.txt ]; then
    echo "==> Instalando paquetes de AUR (requiere yay o paru)..."
    if command -v yay &> /dev/null; then
        yay -S --needed - < packages-aur.txt
    elif command -v paru &> /dev/null; then
        paru -S --needed - < packages-aur.txt
    else
        echo "No se encontró yay ni paru. Instala uno y corre:"
        echo "  yay -S --needed - < packages-aur.txt"
    fi
fi

echo "==> Adaptando config al usuario actual: $(whoami)..."
find "$(dirname "$0")/hypr" -type f \( -name "*.json" -o -name "*.conf" -o -name "*.sh" -o -name "*.qml" -o -name "*.py" \) \
    -exec sed -i "s|/home/german|$HOME|g" {} \;
echo "    Paths actualizados para: $HOME"

echo "==> Aplicando dotfiles con stow..."
stow hypr

echo ""
echo "==> Listo! Pasos finales:"
echo "    1. Crea tu API key del clima:"
echo "       nano ~/.config/hypr/scripts/quickshell/calendar/.env"
echo "    2. Agrega wallpapers en: ~/Pictures/Wallpapers"
echo "    3. Reinicia sesión o corre: hyprctl reload"
