cask "heimdall" do
  version "0.3.1"
  sha256 "b2e71e96ebf0dda53273174c5ac83945accc6a4b4cac03c8ec65c08df0ad2573"

  url "https://github.com/mhandschuh/heimdall-release/releases/download/v#{version}/Heimdall-#{version}.zip"
  name "Heimdall"
  desc "Fast dual-pane file manager"
  homepage "https://github.com/mhandschuh/heimdall-release"

  depends_on macos: :ventura
  app "Heimdall.app"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  # Homebrew runs these steps in a sandbox that may write to the Applications folder.
  quarantined = "#{appdir}/Heimdall.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", quarantined]
  end

  zap trash: [
    "~/Library/Application Support/Explorious",
    "~/Library/Preferences/dev.explorious.app.plist",
  ]
end
