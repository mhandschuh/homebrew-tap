cask "saga" do
  version "0.2.0"
  sha256 "5d41ce1ab8d9b8d86f4e4db2f7a25f8882e0f4db288c692ec717f3f2f9d421a8"

  url "https://github.com/mhandschuh/saga-release/releases/download/v#{version}/Saga-#{version}.zip"
  name "Saga"
  desc "Inline text completion everywhere, with a local model"
  homepage "https://github.com/mhandschuh/saga-release"

  depends_on macos: :sonoma
  depends_on arch: :arm64
  app "Saga.app"
  binary "#{appdir}/Saga.app/Contents/MacOS/ghostwriter", target: "saga"
  binary "#{appdir}/Saga.app/Contents/Resources/download-model.sh", target: "saga-download-model"

  # Signed with a self-signed certificate, not notarized by Apple: let macOS open it without the
  # "unverified developer" block.
  # Homebrew runs these steps in a sandbox that may write to the Applications folder.
  quarantined = "#{appdir}/Saga.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", quarantined]
  end

  caveats <<~EOS
    Saga needs a model (about 3 GB, downloaded once):
      saga-download-model
    Then open Saga and allow it in System Settings → Privacy & Security (Accessibility and Input Monitoring).
    Allowed but nothing happens (a permission left from an older build)? Reset and allow again:
      tccutil reset Accessibility dev.ghostwriter.app && tccutil reset ListenEvent dev.ghostwriter.app
  EOS

  zap trash: "~/Library/Application Support/ghostwriter"
end
