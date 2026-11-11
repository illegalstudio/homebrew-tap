class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.5.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.5.0/darkbox_1.5.0_darwin_arm64.zip"
    sha256 "fef98a8973f4fa8522fd118296aafc52ec2598542420a5039bd02411ec772f63"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.5.0/darkbox_1.5.0_linux_arm64.tar.gz"
      sha256 "dc73932a41be87692de2a063e80974342b936df9821c2bfba6c1899dbd1707a2"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.5.0/darkbox_1.5.0_linux_amd64.tar.gz"
      sha256 "267441cac924554e181a3f8f2e6237d057f60d0a4f6ea60de84949818b1facec"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.5.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
