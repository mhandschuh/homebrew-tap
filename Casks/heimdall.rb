cask "heimdall" do
  version "0.2.0"
  sha256 "967bf6bdc551642b0c7ecc8ed68b79de06375e8ca0aa6775b6600a946d5dc0c1"

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
