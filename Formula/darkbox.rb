class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "3.0.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v3.0.1/darkbox_3.0.1_darwin_arm64.zip"
    sha256 "bed7e1ac8a1c4c22b20e73367932c3e13cd844281ae15bbf299d70cc692f8786"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v3.0.1/darkbox_3.0.1_linux_arm64.tar.gz"
      sha256 "acf1bd3dc8c6f8066fc3d0d8895a19eb0dc772b95853aba9cdc8405b89ff2b5b"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v3.0.1/darkbox_3.0.1_linux_amd64.tar.gz"
      sha256 "beb209eb844a1f8f351bac99353db627703876ed211f5964f5a7b9f23e0f8984"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "3.0.1", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
