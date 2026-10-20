cask "brokkr" do
  version "0.2.0"
  sha256 "3be0afb02d22293bd39a1195d5bd706937a408a1e7c1ab4f39a996c551a39e5e"

  url "https://github.com/mhandschuh/brokkr-release/releases/download/v#{version}/Brokkr-#{version}.zip"
  name "Brokkr"
  desc "Menu bar toolbox: keep awake, calendar, shelf, scratchpad, mouse, displays"
  homepage "https://github.com/mhandschuh/brokkr-release"

  depends_on macos: :sonoma
  depends_on arch: :arm64
  app "Brokkr.app"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  # Homebrew runs these steps in a sandbox that may write to the Applications folder.
  quarantined = "#{appdir}/Brokkr.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", quarantined]
  end

  zap trash: [
    "~/Library/Application Support/Brokkr",
    "~/Library/Logs/Brokkr.log",
  ]
end
