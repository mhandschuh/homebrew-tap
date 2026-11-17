# Homebrew tap

The Mac apps of the Pantheon, installable with [Homebrew](https://brew.sh):

```sh
brew install mhandschuh/tap/heimdall   # dual-pane file manager
brew install mhandschuh/tap/saga       # inline text completion with a local model
brew install mhandschuh/tap/brokkr     # menu bar toolbox: keep awake, calendar, shelf, scratchpad, mouse
brew install mhandschuh/tap/bifrost    # window switcher: ⌘Tab opens a ring of windows, letters jump
brew install mhandschuh/tap/gjallar    # terminal: Docker sandboxes, their rules and approvals
brew upgrade --cask                    # updates of the apps
brew upgrade gjallar                   # updates of Gjallar
```

The apps are signed with a self-signed certificate, not notarized by Apple; the casks lift macOS's quarantine on
install so they open normally. Gjallar, a terminal program, is a formula with a prebuilt binary (`Formula/`); a
formula's download isn't quarantined. Casks and formula are updated by each app's `./x release`.
