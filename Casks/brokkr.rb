cask "brokkr" do
  version "0.3.1"
  sha256 "098d9b77b3bb53cd7c2c318f62a81323df7fb8428b54e015e3cdcaf1c1aa512e"

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
