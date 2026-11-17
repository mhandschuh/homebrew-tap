class Gjallar < Formula
  desc "Docker sandboxes (sbx) in the terminal: rules by sandbox, approvals answered with one key"
  homepage "https://github.com/mhandschuh/gjallar-release"
  # Filled by gjallar's ./x release: a prebuilt binary, as the code is private.
  url "https://github.com/mhandschuh/gjallar-release/releases/download/v0.0.0/gjallar-0.0.0-arm64-macos.tar.gz"
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gjallar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gjallar --version")
  end
end
