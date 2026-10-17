# Changelog

All notable changes to Drift are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

### Added

- Synced lyrics via LRCLIB. `L` or `:lyrics` toggles a side panel, `F` opens fullscreen.
- Current lyric line is highlighted with a progress fill; nearby lines fade out.
- Plain lyrics fallback (scroll with `j`/`k`) when no synced version exists.

### Changed

- Tab bar redesigned as pills with dimmed counts on inactive tabs.
- Tab bar only reserves spinner space while busy, so tabs fit on narrow terminals.
