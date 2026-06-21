#!/bin/bash
set -e

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

echo "==> Listo. Ahora corre: stow hypr"
