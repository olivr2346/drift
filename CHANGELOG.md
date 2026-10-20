# Changelog

Changes to drift. Loosely follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Unreleased

### Added

- MPRIS on linux. media keys, `playerctl` and waybar can now see and control drift (play/pause/next/prev/seek/stop), with title, artist, album and cover art. Shows up as `org.mpris.MediaPlayer2.drift`. If theres no dbus session it just doesnt start, nothing breaks.
- `:album <query>` to search albums, `:playlist <query>` to search youtube music playlists. Results show up in a picker, enter loads the tracks. (`:playlists` is still your own playlists tab.) Big playlists stop at ~300 tracks.
- `gb` / `:album` / `G` then `b` opens the album of the selected song. It finds it by album + artist name so it can guess wrong sometimes, and the song needs album info to begin with.
- `gs` / `:similar` / `:radio` loads ~50 songs similar to the selected one and starts playing them, like youtube music radio.
- Synced lyrics from LRCLIB. `L` toggles the side panel, `F` for fullscreen. Current line gets a progress fill, lines around it fade.
- Plain lyrics fallback when theres no synced version, scroll with `j`/`k`.

### Changed

- Album tracks now get the artist/album/length filled in when youtube leaves them out.
- Tracks from a playlist get their album too, so `gb` works on them.
- New dependency on linux: `souvlaki` (zbus backend, pure rust, no system libs). `Cargo.lock` needs a regen, just run `cargo build` once. `--locked` builds, the flake and the AUR package need the new lock.
- Tab bar is pills now, inactive tabs have dimmed counts.
- Tab bar only reserves space for the spinner while busy, fits narrow terminals better.

### Fixed

- Playing from a playlist no longer replaces the queue. Playlists play as their own list, queue only has what you add, queued songs go first and then the playlist continues.
- Shuffle and repeat-all work for playlists and results now. repeat-all used to loop the queue instead of the list you were actualy playing.
- `P` / `:playall` doesnt wipe the queue anymore.
