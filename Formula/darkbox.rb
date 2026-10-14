class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.1.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.1.0/darkbox_1.1.0_darwin_arm64.zip"
    sha256 "d512ecf64d6303b8bbc3805764c1fad71e252feadaf30522f6fa103fa1f8d80f"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.1.0/darkbox_1.1.0_linux_arm64.tar.gz"
      sha256 "3625ca1e15cbc0c401900b6f72aed06d557bade5ac7046a8e590c260879fc741"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.1.0/darkbox_1.1.0_linux_amd64.tar.gz"
      sha256 "68f2b42950670f6997f4576db5f60d05cfbe17d46ab043b4101b2ebb5fa02663"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.1.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
