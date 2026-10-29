#!/bin/sh
set -eu

install_packages() {
    if [ "$(id -u)" -eq 0 ]; then
        "$@"
    else
        sudo "$@"
    fi
}

echo "-> Detecting package manager..."

if command -v pacman >/dev/null 2>&1; then
    # Arch Linux, Manjaro, EndeavourOS, CachyOS
    install_packages pacman -S --needed --noconfirm \
        mpv yt-dlp base-devel rust

elif command -v apt-get >/dev/null 2>&1; then
    # Debian, Ubuntu, Linux Mint, Pop!_OS, elementary OS
    install_packages apt-get update
    install_packages apt-get install -y \
        mpv yt-dlp build-essential cargo

elif command -v dnf >/dev/null 2>&1; then
    # Fedora, RHEL (ew), Rocky Linux, AlmaLinux
    install_packages dnf install -y \
        mpv yt-dlp gcc gcc-c++ make cargo

elif command -v zypper >/dev/null 2>&1; then
    # openSUSE Leap, Tumbleweed, SUSE Linux Enterprise
    install_packages zypper --non-interactive install \
        mpv yt-dlp gcc gcc-c++ make cargo

elif command -v xbps-install >/dev/null 2>&1; then
    # Void Linux
    install_packages xbps-install -Sy \
        mpv yt-dlp base-devel cargo

elif command -v apk >/dev/null 2>&1; then
    # Alpine Linux or Chimera
    install_packages apk add \
        mpv yt-dlp build-base cargo

elif command -v emerge >/dev/null 2>&1; then
    # Gentoo :3
    install_packages emerge \
        media-video/mpv net-misc/yt-dlp \
        sys-devel/gcc dev-lang/rust

elif command -v zypper >/dev/null 2>&1; then
    install_packages zypper install \
        mpv yt-dlp gcc cargo

else
    echo "Error: unsupported package manager." >&2
    echo "Install mpv, yt-dlp, a C compiler, and Cargo manually." >&2
    exit 1
fi

echo "-> Checking required commands..."

for cmd in cargo mpv yt-dlp; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd was not found after installation." >&2
        exit 1
    fi
done

echo "-> Installing drift..."

cargo install --git https://github.com/socatlolmeow/drift

echo "-> Drift installation complete!"
echo "Run 'drift' to start the application."
echo "If the command is not found, pls check that ~/.cargo/bin is in your PATH"
