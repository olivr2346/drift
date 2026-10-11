<div align="center">

<h1>Drift</h1>

[![Stars](https://img.shields.io/github/stars/socatlolmeow/drift?style=flat-square&logo=github)](https://github.com/socatlolmeow/drift/stargazers)
![License](https://img.shields.io/github/license/socatlolmeow/drift?style=flat-square)

### A music streaming client using Vim keybinds built in Rust.

Stream your favourite music from YouTube Music — all in one client, in your terminal.

</div>

---

<div align="center">
  <img src="https://github.com/socatlolmeow/drift/blob/main/examples/showcase.gif?raw=true" alt="Drift showcase" />
</div>

---

## Features

- **YouTube Music streaming** - search and play tracks straight from YouTube Music, with no account or login
- **Vim-style keybinds** - move with `j`/`k`, jump with `gg`/`ge`, use counts like `5j`, and open the command line with `:`
- **Song context menu** - press `G` on any song for quick actions: play, queue, add to playlist, show artist, and song info
- **Command palette** - a redesigned `:` prompt with the full command set (`:search`, `:seek`, `:vol`, `:import`, and more)
- **Audio visualizer** - a live visualizer in the bottom-left corner while music plays
- **Playlists & queue** - save, load, and reorder playlists, or import any YouTube / YouTube Music playlist by URL
- **Artist browsing** - press `ga` to jump to an artist's songs
- **Session restore** - your queue and playback position come back the next time you launch

---

## Installation

### Arch Linux (AUR)

```bash
yay -S driftmusic-git
```

Any AUR helper works (`paru -S driftmusic-git`), or build it by hand:

```bash
git clone https://aur.archlinux.org/driftmusic-git.git
cd driftmusic-git
makepkg -si
```

`mpv` and `yt-dlp` are installed automatically.

### Other distros

Install the dependencies:

- [mpv](https://mpv.io/) — audio playback
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) — YouTube stream extraction
- [Rust](https://rustup.rs/) (build only)

Then build from source:

```bash
git clone https://github.com/socatlolmeow/drift.git
cd drift
cargo build --release
sudo cp target/release/drift /usr/local/bin/
```

Or install directly with cargo:

```bash
cargo install --path .
```

This installs `drift` to `~/.cargo/bin/`, which is on your `$PATH` if you installed Rust via [rustup](https://rustup.rs/).

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=socatlolmeow/drift&type=Date)](https://star-history.com/#socatlolmeow/drift)

---

## License

[Drift](https://github.com/socatlolmeow/drift) is FOSS, released under the [GNU General Public License version 3 or later](https://www.gnu.org/licenses/gpl-3.0.html).
