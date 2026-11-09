cask "bifrost" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mhandschuh/bifrost-release/releases/download/v#{version}/Bifrost-#{version}.zip"
  name "Bifrost"
  desc "Window switcher: ⌘Tab opens a ring of the open windows, letters jump, any window comes forward"
  homepage "https://github.com/mhandschuh/bifrost-release"

  depends_on macos: :sonoma
  depends_on arch: :arm64
  app "Bifrost.app"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  # Homebrew runs these steps in a sandbox that may write to the Applications folder.
  quarantined = "#{appdir}/Bifrost.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", quarantined]
  end

  zap trash: [
    "~/Library/Application Support/Bifrost",
    "~/Library/Logs/Bifrost.log",
  ]
end
