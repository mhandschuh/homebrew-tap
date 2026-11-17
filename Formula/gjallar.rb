class Gjallar < Formula
  desc "Docker sandboxes (sbx) in the terminal: rules by sandbox, approvals answered with one key"
  homepage "https://github.com/mhandschuh/gjallar-release"
  # Filled by gjallar's ./x release: a prebuilt binary, as the code is private.
  url "https://github.com/mhandschuh/gjallar-release/releases/download/v0.1.0/gjallar-0.1.0-arm64-macos.tar.gz"
  version "0.1.0"
  sha256 "e5425daec1cc14da1fd2c2ef9be86e3d437d09048b9b5cd606c7c3e84199e2dd"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "gjallar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gjallar --version")
  end
end
