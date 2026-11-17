cask "odin" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mhandschuh/odin-release/releases/download/v#{version}/Odin-#{version}.zip"
  name "Odin"
  desc "Projects with their live Claude Code sessions, opened in Ghostty"
  homepage "https://github.com/mhandschuh/odin-release"

  depends_on macos: :sonoma
  depends_on arch: :arm64
  app "Odin.app"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  # Homebrew runs these steps in a sandbox that may write to the Applications folder.
  quarantined = "#{appdir}/Odin.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", quarantined]
  end

  zap trash: [
    "~/Library/Application Support/Yggdrasil",
  ]
end
