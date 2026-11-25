class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "2.0.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v2.0.0/darkbox_2.0.0_darwin_arm64.zip"
    sha256 "112a2c07cac945be2f6cd48e2f25c7f2c161c9a98b360d5f3aa577d853cb031a"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v2.0.0/darkbox_2.0.0_linux_arm64.tar.gz"
      sha256 "86dc34675913e688d721e59c5412b9d75861bc12adef777ff2a0db39db42176a"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v2.0.0/darkbox_2.0.0_linux_amd64.tar.gz"
      sha256 "4020eede9cf10ede941191dd69f2ce6c7a1e5b3ac605d535039efb52ba208c75"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "2.0.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
