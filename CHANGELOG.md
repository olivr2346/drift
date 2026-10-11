# Changelog

All notable changes to Drift are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- **Windows support.** Drift now runs natively on Windows. It talks to `mpv` over named pipes instead of Unix sockets.
- **Song context menu.** Press `G` on a song or playlist for quick actions: play, play next, add to queue, add to playlist, show artist, remove, and song info.
- **Song info popup.** "Song info" in the `G` menu opens a centered popup with the title, artist, album, length, and ID. Press any key to close it.
- **Redesigned `:` command menu.**
- **Audio visualizer** in the bottomleft corner.
- **Keybind hints** shown next to the volume control.
- **Status toasts.** Messages such as "Queued…" and errors now appear as a small floating toast above the Now Playing bar. Errors are red and info messages are green.
- `DRIFT_CONFIG_DIR` and `DRIFT_STATE_DIR` environment variables to override where Drift stores its config, playlists, and session.
- Install hints for Scoop and winget when `mpv` or `yt-dlp` is missing.

### Changed

- Status messages no longer share the bottom border of the Now Playing bar. That border now only shows pending key presses.
- On Windows, `mpv` and `yt-dlp` start without flashing a console window.
- On Windows, `mpv` is stopped when Drift exits, including after a crash. This matches the existing Linux behavior.
- Saving playlists and the session retries a few times if the file is briefly locked, which can happen on Windows with antivirus software.
- Ctrl+Alt is no longer treated as Ctrl. On Windows, AltGr is reported as Ctrl+Alt, so characters like `@`, `\`, `{`, `[`, and `~` can now be typed in search and `:` commands.

### Fixed

- Song info no longer appears as a cramped line at the bottom of the screen.
- Tests no longer write to your real config folder on Windows.
