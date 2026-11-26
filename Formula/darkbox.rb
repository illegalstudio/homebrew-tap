class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "3.0.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v3.0.0/darkbox_3.0.0_darwin_arm64.zip"
    sha256 "3e8471d13ef455e2938d205d5ff4cd02d13806e6f68d23264db520b4e32f3998"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v3.0.0/darkbox_3.0.0_linux_arm64.tar.gz"
      sha256 "db9e6fb15234bf63a426e57e96584e3092df5204fa0cf011e075667e6eaad525"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v3.0.0/darkbox_3.0.0_linux_amd64.tar.gz"
      sha256 "afcae6202d6f1a7e4953ff9e6cb3b84e25f1284b2c42e1307945ccc494bd2cab"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "3.0.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
