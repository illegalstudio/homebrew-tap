class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.4.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.1/darkbox_1.4.1_darwin_arm64.zip"
    sha256 "99463c79c79c149935e9e28027e97072e33632aa0f2669cdecc30b511d7436aa"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.1/darkbox_1.4.1_linux_arm64.tar.gz"
      sha256 "b2e28a9cfb0ff15dafc778e1589c22ebb6080c4de0026aba03b4ca9908e0d2e3"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.1/darkbox_1.4.1_linux_amd64.tar.gz"
      sha256 "69e499bec38de434ac1e2065e942e5f2fdfceb20c27bb0c1f38e9421ade1104f"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.4.1", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
