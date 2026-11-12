class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.6.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.0/darkbox_1.6.0_darwin_arm64.zip"
    sha256 "985c8e0ef6f8cdead226e637682b1992783536207d4a6b6aaf0b9d38613ff62e"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.0/darkbox_1.6.0_linux_arm64.tar.gz"
      sha256 "ec2834a5a77e57069092d34bd770ccd23993ec66c024e44a549b80a6ecbf67ee"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.0/darkbox_1.6.0_linux_amd64.tar.gz"
      sha256 "f78b840e43e3e85f72b1369a9c8f98b539bb6921d5c4c690437b857cf793d1bb"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.6.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
