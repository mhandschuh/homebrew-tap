cask "saga" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mhandschuh/saga-release/releases/download/v#{version}/Saga-#{version}.zip"
  name "Saga"
  desc "Inline text completion everywhere, with a local model"
  homepage "https://github.com/mhandschuh/saga-release"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64
  app "Saga.app"
  binary "#{appdir}/Saga.app/Contents/MacOS/ghostwriter", target: "saga"
  binary "#{appdir}/Saga.app/Contents/Resources/download-model.sh", target: "saga-download-model"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Saga.app"]
  end

  caveats <<~EOS
    Saga needs a model (about 3 GB, downloaded once):
      saga-download-model
    Then open Saga and allow it under System Settings → Privacy & Security → Accessibility.
  EOS

  zap trash: "~/Library/Application Support/ghostwriter"
end
