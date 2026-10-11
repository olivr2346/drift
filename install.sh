#!/bin/sh
set -e

if command -v pacman >/dev/null; then
    sudo pacman -S --needed --noconfirm mpv yt-dlp base-devel rust
elif command -v apt >/dev/null; then
    sudo apt install -y mpv yt-dlp build-essential cargo
elif command -v dnf >/dev/null; then
    sudo dnf install -y mpv yt-dlp gcc cargo
elif command -v xbps-install >/dev/null; then
    sudo xbps-install -Sy mpv yt-dlp base-devel cargo
else
    echo "unsupported package manager: install mpv, yt-dlp and cargo manually" >&2
    exit 1
fi

cargo install --git https://github.com/socatlolmeow/drift
