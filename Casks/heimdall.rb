cask "heimdall" do
  version "0.7.0"
  sha256 "ffe4fcbe93534feaf5e0143e16b7507c9acf579a0e0a2813f99d3001f5d0498a"

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
