cask "heimdall" do
  version "0.4.0"
  sha256 "c7489d0a0f4924c8bb5e996a7032228d60961e4bfddb146b4b36a642c2a8130d"

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
