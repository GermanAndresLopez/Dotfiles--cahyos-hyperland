# Dotfiles — CachyOS + Hyprland + Quickshell

Setup personal de escritorio basado en CachyOS con Hyprland como compositor y Quickshell como shell/barra.

## Requisitos previos
- CachyOS instalado (sin desktop environment)
- Conexión a internet
- `git` instalado: `sudo pacman -S git`

## Instalación

```bash
git clone git@github.com:GermanAndresLopez/Dotfiles--cahyos-hyperland.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

El script instala todos los paquetes, aplica los dotfiles con Stow y muestra los pasos finales.

## Pasos post-instalación

### 1. API key del clima

Crea el archivo de variables del widget de clima:

```bash
nano ~/.config/hypr/scripts/quickshell/calendar/.env
```

Contenido:

```
OPENWEATHER_KEY='tu_key_aqui'
OPENWEATHER_CITY_ID='tu_ciudad_id'
OPENWEATHER_UNIT='metric'
```

Obtén tu key gratis en https://openweathermap.org/api  
Para tu ciudad ID busca en https://openweathermap.org/find

### 2. Wallpapers

```bash
mkdir -p ~/Pictures/Wallpapers
```

### 3. Monitores

La config de monitores está ajustada para el hardware original. Si tienes monitores diferentes, edita:

```bash
nano ~/.config/hypr/settings.json
```

Ajusta el bloque `"monitors"` con tu resolución y nombre de monitor. Usa `hyprctl monitors` para ver los disponibles.

### 4. Bluetooth

El pairing hay que hacerlo manualmente desde cada máquina:

```bash
bluetoothctl
agent on
default-agent
scan on
pair XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
```

### 5. Auto-cpufreq

Verifica que esté activo:

```bash
systemctl is-active auto-cpufreq
```

## Estructura del repo

```
dotfiles/
├── hypr/                          Config de Hyprland + Quickshell (Stow)
│   └── .config/hypr/
│       ├── settings.json          Fuente de verdad (editar aquí, no en .conf)
│       ├── templates/             Moldes para generar .conf
│       ├── config/                Configs autogeneradas (no editar)
│       └── scripts/quickshell/   Shell QML y módulos de la barra
├── packages.txt                   Paquetes oficiales (pacman)
├── packages-aur.txt               Paquetes AUR (yay/paru)
├── install.sh                     Script de instalación
└── README.md                      Este archivo
```

## Keybinds principales

| Atajo | Acción |
|---|---|
| `Win + Enter` | Terminal (kitty) |
| `Win + E` | Explorador de archivos (nautilus) |
| `Win + Space` | Lanzador de apps |
| `Win + Q` | Cerrar ventana |
| `Win + F` | Fullscreen real |
| `Win + ↑ / ↓` | Maximizar / restaurar |
| `Win + ← / →` | Cambiar foco entre ventanas |
| `Win + Shift + F` | Modo flotante |
| `Win + L` | Bloquear pantalla |
| `Win + 1-5` | Cambiar workspace |
| `Win + Shift + 1-5` | Mover ventana a workspace |
| `Win + B` | Menú batería y apagado |
| `Win + N` | Red y bluetooth |
| `Win + V` | Volumen |
| `Win + M` | Música |
| `Win + S` | Calendario |
| `Win + C` | Portapapeles |
