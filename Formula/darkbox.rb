class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.0.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.0.0/darkbox_1.0.0_darwin_arm64.zip"
    sha256 "bf1f7d7435213ba84a42a7a67b0f6af0026961243fd6210dc002ea5c67a184da"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.0.0/darkbox_1.0.0_linux_arm64.tar.gz"
      sha256 "374e6049cb70139d5c8b7e8ee6ba73b51b7740dcf3376330a43c4874047ec295"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.0.0/darkbox_1.0.0_linux_amd64.tar.gz"
      sha256 "50619bff1be1ffa9b485385fcc9f411cac911417ded375ec4dd88c3c2d26a139"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
