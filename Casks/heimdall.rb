cask "heimdall" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mhandschuh/heimdall-release/releases/download/v#{version}/Heimdall-#{version}.zip"
  name "Heimdall"
  desc "Fast dual-pane file manager"
  homepage "https://github.com/mhandschuh/heimdall-release"

  depends_on macos: ">= :ventura"
  app "Heimdall.app"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Heimdall.app"]
  end

  zap trash: [
    "~/Library/Application Support/Explorious",
    "~/Library/Preferences/dev.explorious.app.plist",
  ]
end
