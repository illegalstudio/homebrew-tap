class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.6.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.2/darkbox_1.6.2_darwin_arm64.zip"
    sha256 "bba0b67cc81624c02038f58339affd7acc84efd0611020dacf6ff3bea29e3d61"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.2/darkbox_1.6.2_linux_arm64.tar.gz"
      sha256 "8e3b3582d44c5453d2f58adefdc2c417788ac022a57ad15dae8a2e9e2f44860f"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.2/darkbox_1.6.2_linux_amd64.tar.gz"
      sha256 "9f0a888012d92557920b07f978c94848a5d3b66922d171b023a922940ee2029a"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.6.2", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
