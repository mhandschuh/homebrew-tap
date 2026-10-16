# Homebrew tap

The Mac apps of the Pantheon, installable with [Homebrew](https://brew.sh):

```sh
brew install mhandschuh/tap/heimdall   # dual-pane file manager
brew install mhandschuh/tap/saga       # inline text completion with a local model
brew upgrade --cask                    # updates
```

The apps are signed with a self-signed certificate, not notarized by Apple; the casks lift macOS's quarantine on
install so they open normally. The casks are updated by each app's `./x release`.
