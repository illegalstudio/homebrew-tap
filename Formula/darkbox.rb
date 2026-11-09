class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.4.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.2/darkbox_1.4.2_darwin_arm64.zip"
    sha256 "ad86da902d56a96aa4d3315c0a4204751d71a1c00808f78cd3a33caeb173904f"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.2/darkbox_1.4.2_linux_arm64.tar.gz"
      sha256 "9e00b1d562c079bba227134202b2ff2cd66f54087d76256253e10bc7e04070d4"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.2/darkbox_1.4.2_linux_amd64.tar.gz"
      sha256 "036b52f546248c1ff362e4d2794e9ad133c3f6d0a7fad6e8cbbca21e68795a52"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.4.2", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
