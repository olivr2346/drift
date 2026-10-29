<div align="center">

<h1>Drift (Enhanced Fork)</h1>

[![License](https://img.shields.io/github/license/olivr2346/drift?style=flat-square)](LICENSE)
![Rust](https://img.shields.io/badge/built%20with-Rust-orange?style=flat-square&logo=rust)

### A YouTube Music player for your terminal, with Vim keybinds and enhanced playlist management.

Search, queue and play music with no account, no login and no browser.

</div>

> [!NOTE]
> This is a customized fork of [socatlolmeow/drift](https://github.com/socatlolmeow/drift) with native, one-step album and search-result playlist saving (`:savealbum`, `:saveresults`, `gB`, and collection picker shortcuts).

---

<div align="center">
  <img src="https://github.com/socatlolmeow/drift/blob/main/examples/showcase.gif?raw=true" alt="Drift showcase" />
</div>

---

## 🌟 What's different in this fork?

This fork enhances Drift with seamless, one-action playlist creation from full albums and search results without having to wipe or touch your current playback queue:

- **1-Click Album to Playlist (`:savealbum [name]`)**: Save full albums to a playlist in one go. If no name is provided, it automatically defaults to the album's official title.
- **Save from any track (`G` → `B` or `gB`)**: Highlight or play any song in Results, Queue, or Playlists and press `B` in the `G` menu (or press `gB` in normal mode) to fetch and save its full parent album in the background.
- **Album picker quick-save (`s`)**: In the `:album <query>` search popup, hit `s` on any highlighted album to save it directly without needing to open it first.
- **Save Results directly (`:saveresults [name]`)**: Save any active search, radio, or artist tracklist straight to a playlist without touching your active queue.

---

## Features

- **No login** - search and stream straight from YouTube Music
- **Vim-style keybinds** - `j`/`k`, `gg`/`ge`, counts like `5j`, and `:` for the command line
- **Synced lyrics** - a side panel or fullscreen view with the current line highlighted as it's sung
- **Playlists & queue** - save, load and reorder playlists, or import any YouTube / YouTube Music playlist by URL
- **Song menu** - press `G` on a song to play, queue, add to a playlist, save album, jump to the artist or see its info
- **Command palette** - `:search`, `:seek`, `:vol`, `:savealbum`, `:saveresults`, `:import` and more, with completion and history
- **Artist browsing** - press `ga` to see an artist's songs
- **Similar songs** - press `gs` to see similar songs
- **Audio visualizer** - a live visualizer while music plays
- **Configurable** - volume, seek step, repeat/shuffle defaults and accent color in a single TOML file

## Installation

Drift needs [mpv](https://mpv.io/) for playback and [yt-dlp](https://github.com/yt-dlp/yt-dlp) for stream extraction. Run `drift --check` at any time to verify both are installed.

> [!TIP]
> The Arch Linux AUR package (`driftmusic-git`) tracks the upstream repository. To run this enhanced fork with album-saving support, install it from this repository using `cargo` or the install script below.

### From source (Recommended)

Install the dependencies and [Rust](https://rustup.rs/), then:

```bash
git clone https://github.com/olivr2346/drift.git
cd drift
cargo install --path .
```

This puts `drift` in `~/.cargo/bin/` (or run `cp target/release/drift ~/.local/bin/`), which is on your `$PATH`.

### Install script

On Arch, Debian/Ubuntu, Fedora and Void, the install script installs the dependencies and builds Drift with cargo:

```bash
git clone https://github.com/olivr2346/drift.git
cd drift
./install.sh
```

<details>
<summary>Installing mpv and yt-dlp manually</summary>

| Platform | Command |
| --- | --- |
| Debian / Ubuntu | `sudo apt install mpv` and `pipx install yt-dlp` |
| macOS | `brew install mpv yt-dlp` |
| Arch | `sudo pacman -S mpv yt-dlp` |
| Windows | `winget install mpv.net yt-dlp.yt-dlp` or `scoop install mpv yt-dlp` |

</details>

## Usage

```bash
drift                    # start the player
drift "daft punk"        # start with a search
drift --check            # verify mpv and yt-dlp are installed
```

Press `/` to search, `Enter` to play, `a` to queue and `?` for the full list of keybinds.

## Keybinds

| Key | Action |
| --- | --- |
| `j` `k` / `↓` `↑` | move (counts work: `5j`) |
| `gg` `ge` | jump to top / bottom (`5gg` goes to row 5) |
| `Tab` `Shift-Tab` | cycle Results / Queue / Playlists |
| `gr` `gq` `gp` | jump to Results / Queue / Playlists |
| `Enter` | play the selected song |
| `Space` | pause / resume |
| `n` `N` | next / previous track |
| `h` `l` / `←` `→` | seek back / forward (counts: `6l`) |
| `+` `-` | volume up / down |
| `s` `r` | toggle shuffle / cycle repeat |
| `a` `A` `P` | queue the song / queue all results / play all results |
| `dd` `x` | remove from queue or playlist |
| `J` `K` | move a queue or playlist item down / up |
| `G` | song menu (play, queue, add to playlist, save album, info) |
| `ga` | go to the artist |
| `gs` | see similar songs |
| `gb` | go to the album |
| `gB` | save album of current song as playlist |
| `L` | toggle the lyrics panel |
| `F` | fullscreen lyrics |
| `/` `:` | search / command line |
| `?` | help |
| `q` | quit |

### Commands

| Command | Action |
| --- | --- |
| `:search "query"` | search YouTube Music |
| `:play [N]` | play or resume, or play row `N` |
| `:seek 90` `1:30` `+10` | absolute or relative seek |
| `:vol 50` `+5` | set or change the volume |
| `:shuffle` `:repeat [off\|all\|one]` | playback modes |
| `:add [N]` `:addall` `:playall` | queue results |
| `:save name` `:load name` `:append name` | work with playlists |
| `:savealbum [name]` | save album or current album results as a playlist |
| `:saveresults [name]` | save current results directly as a playlist |
| `:addto name` `:delpl name` | add a song to / delete a playlist |
| `:import URL` | import a YouTube / YouTube Music playlist |
| `:album [query]` | open the selected song's album, or search albums (`s` to save) |
| `:playlist query` | search YouTube Music playlists |
| `:similar` | radio: songs similar to the selected one (also `:radio`) |
| `:artist` | songs by the selected song's artist |
| `:lyrics` | toggle the lyrics panel |

## Lyrics

Press `L` for a side panel (needs a terminal at least 70 columns wide) or `F` for fullscreen. The current line is highlighted and fills in as it's sung. Songs without synced lyrics show plain text you can scroll with `j`/`k`.

Lyrics come from [LRCLIB](https://lrclib.net) and are only fetched while the panel or fullscreen view is open.

## Configuration

Settings live in `config.toml` inside Drift's config directory (`~/.config/drift/` on Linux). Drift only reads the file and never rewrites it, so your comments are safe. Restart Drift after editing.

```toml
[playback]
volume = 80
shuffle = false
repeat = "off"        # off, all or one
autoplay = false
restore_session = true
seek_step = 5.0
volume_step = 5.0

[artist]
popular_first = false

[ui]
accent = "cyan"       # a color name or a hex value like "#FF8800"

[discord]
client_id = ""        # change this for Discord RPC to work in Drift         
```

Set `DRIFT_CONFIG_DIR` or `DRIFT_STATE_DIR` to change where Drift keeps its config, playlists and session.

## Contributing

Bug reports, ideas and pull requests are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) before you start.

## License

[Drift](https://github.com/socatlolmeow/drift) is free software created by [socatlolmeow](https://github.com/socatlolmeow), released under the [GNU General Public License version 3 or later](https://www.gnu.org/licenses/gpl-3.0.html).
