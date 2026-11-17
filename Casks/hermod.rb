cask "hermod" do
  version "0.1.0"
  sha256 "e77b2912cf61b0a02a01583ab3ccd24c4dee3e91d4898a87c9045688025fcb6a"

  url "https://github.com/mhandschuh/hermod-release/releases/download/v#{version}/Hermod-#{version}.zip"
  name "Hermod"
  desc "All mail sorted into categories with reasons, read only"
  homepage "https://github.com/mhandschuh/hermod-release"

  depends_on macos: :sonoma
  depends_on arch: :arm64
  app "Hermod.app"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  # Homebrew runs these steps in a sandbox that may write to the Applications folder.
  quarantined = "#{appdir}/Hermod.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", quarantined]
  end

  zap trash: [
    "~/Library/Application Support/Hermod",
    "~/Library/Caches/Hermod",
  ]
end
