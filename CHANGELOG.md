# Changelog

Changes to drift. Loosely follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Unreleased

### Added

- Discord rich presence. Your current song shows up in your Discord status as "Listening to ...", with cover art, album, a progress bar and a "Listen Along" button. Paused songs show `(paused)` and drop the timer. Off by default: make an application at https://discord.com/developers/applications (its name is what shows after "Listening to"), paste the Application ID into `client_id` under the new `[discord]` section of `config.toml`. If discord isnt running drift keeps retrying quietly in the background.
- `:save!` / `:w!` to overwrite an existing playlist. Plain `:save` now refuses if the name is taken and tells you to use `:save!` (replace) or `:append` (add to the end).
- MPRIS on linux. media keys, `playerctl` and waybar can now see and control drift (play/pause/next/prev/seek/stop), with title, artist, album and cover art. Shows up as `org.mpris.MediaPlayer2.drift`. If theres no dbus session it just doesnt start, nothing breaks.
- `:album <query>` to search albums, `:playlist <query>` to search youtube music playlists. Results show up in a picker, enter loads the tracks. (`:playlists` is still your own playlists tab.) Big playlists stop at ~300 tracks.
- `gb` / `:album` / `G` then `b` opens the album of the selected song. It finds it by album + artist name so it can guess wrong sometimes, and the song needs album info to begin with.
- `gs` / `:similar` / `:radio` loads ~50 songs similar to the selected one and starts playing them, like youtube music radio.
- Synced lyrics from LRCLIB. `L` toggles the side panel, `F` for fullscreen. Current line gets a progress fill, lines around it fade.
- Plain lyrics fallback when theres no synced version, scroll with `j`/`k`.

### Changed

- Playback now downloads the audio with yt-dlp first and plays the local file instead of letting mpv stream it (`--ytdl=no`). Files live in the cache dir under `drift/audio` (last 40 are kept). The next queued song is fetched in the background while the current one plays, so track changes are quicker. Songs that are already cached start instantly.
- Playback errors show the actual reason from yt-dlp/mpv (e.g. "Sign in to confirm you're not a bot") instead of a generic "update yt-dlp" hint. Status messages can be wider too (70 -> 120 chars).
- Artists are split using the credits youtube gives us (linked artist names) instead of guessing from the text, so names like "Tyler, The Creator" stay in one piece. yt-dlp's `artists` list is used too. The text-based fallback (old saves, plain yt-dlp) knows a list of common band names with `,` / `&` in them, and matches separators case-insensitively. Affects `ga`, `gb`, `gs` and the lyrics lookup.
- Selected rows use an accent colored bold text + `▎` bar instead of a filled background.
- Tab bar went back to plain text: the active tab is accent colored, bold and underlined, inactive ones are gray with dimmed counts. (replaces the pills.)
- Tab bar only reserves space for the spinner while busy, fits narrow terminals better.
- Album tracks now get the artist/album/length filled in when youtube leaves them out.
- Tracks from a playlist get their album too, so `gb` works on them.
- Search/radio requests share one http connection instead of making a new one every time.
- New dependencies: `discord-rich-presence` (everywhere) and, on linux, `souvlaki` (zbus backend, pure rust, no system libs). `Cargo.lock` needs a regen, just run `cargo build` once. `--locked` builds, the flake and the AUR package need the new lock.

### Fixed

- Running several drifts at once no longer clobbers stuff. Only the first one restores and saves the session (a `session.lock` file, unix only), and saving playlists merges with whatever the other instance wrote instead of overwriting it, so playlists made in another window dont disappear.
- Collection picker (`:album`, `:playlist`) no longer pops up in the middle of typing and steals your keys, it waits until you're back in normal mode.
- "Play next" (song menu) didnt shift the "already played" marks, so shuffle could replay or skip the wrong songs after it. fixed.
- Starting a song from a playlist/results while a queue is playing no longer drags the old queue along: whats queued counts as done and only songs you add afterwards play after it.
- Playing from a playlist no longer replaces the queue. Playlists play as their own list, queue only has what you add, queued songs go first and then the playlist continues.
- Shuffle and repeat-all work for playlists and results now. repeat-all used to loop the queue instead of the list you were actualy playing.
- `P` / `:playall` doesnt wipe the queue anymore.
- Lyrics sorting no longer has an `unwrap()` that could panic on a NaN time drift
