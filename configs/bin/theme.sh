#!/bin/bash

# Install:
# chmod +x theme.sh
# cp theme.sh ~/.local/bin/theme

THEME_DIR="$HOME/.config/i3/themes"
TARGET_LINK="$HOME/.config/i3/current_theme"
WALLPAPER_DIR="$HOME/.config/wallpapers"

set_theme() {
    local THEME="$1"
    local WALLPAPER="$WALLPAPER_DIR/$THEME.png"

    if [[ ! -e "$THEME_DIR/$THEME" ]]; then
        echo "Error: theme '$THEME' not found in $THEME_DIR"
        exit 1
    fi

    if [[ ! -f "$WALLPAPER" ]]; then
        echo "Error: wallpaper '$WALLPAPER' not found"
        exit 1
    fi

    feh --bg-scale "$WALLPAPER"

    ln -sf "$THEME_DIR/$THEME" "$TARGET_LINK"

    i3-msg reload >/dev/null 2>&1

    echo "Theme set to: $THEME"
}

list_themes() {
    if [[ ! -d "$THEME_DIR" ]]; then
        echo "Theme directory not found: $THEME_DIR"
        exit 1
    fi

    echo "Available themes:"
    for t in "$THEME_DIR"/*; do
        [[ -e "$t" ]] || continue
        name=$(basename "$t")
        current=""
        if [[ -e "$TARGET_LINK" && "$(readlink -f "$TARGET_LINK")" == "$(readlink -f "$t")" ]]; then
            current=" (current)"
        fi
        echo "  - $name$current"
    done
}

menu_select() {
    local names=()
    for t in "$THEME_DIR"/*; do
        [[ -e "$t" ]] || continue
        names+=("$(basename "$t")")
    done

    if [[ ${#names[@]} -eq 0 ]]; then
        echo "No themes found in $THEME_DIR"
        exit 1
    fi

    local choice
    if command -v rofi &>/dev/null; then
        choice=$(printf '%s\n' "${names[@]}" | rofi -dmenu -p "Select theme")
    elif command -v dmenu &>/dev/null; then
        choice=$(printf '%s\n' "${names[@]}" | dmenu -p "Select theme")
    else
        echo "Select a theme:"
        select choice in "${names[@]}"; do
            [[ -n "$choice" ]] && break
        done
    fi

    [[ -n "$choice" ]] && set_theme "$choice"
}

usage() {
    echo "Usage: theme <theme-name>"
    echo "       theme -l | --list      List available themes"
    echo "       theme -m | --menu      Open a selection menu (rofi/dmenu/bash select)"
    echo "       theme -h | --help      Show this help"
}

case "$1" in
    -l|--list)
        list_themes
        ;;
    -m|--menu)
        menu_select
        ;;
    -h|--help|"")
        usage
        ;;
    *)
        set_theme "$1"
        ;;
esac

