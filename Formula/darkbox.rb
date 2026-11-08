class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.2.0/darkbox_1.2.0_darwin_arm64.zip"
    sha256 "6602fc0d0169be4080837a71e0b7127729d9d26478b5559d91bb8edb5ce06f98"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.2.0/darkbox_1.2.0_linux_arm64.tar.gz"
      sha256 "3635526c954aafa5c3886403c75866c742c321c0f0a1aa61f003ce0391bf1c89"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.2.0/darkbox_1.2.0_linux_amd64.tar.gz"
      sha256 "f1364512a286c824adf5d1a52f955d2593ec69d1efc51e7dace5c056e032f4d8"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.2.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
