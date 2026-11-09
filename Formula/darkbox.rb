class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.4.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.0/darkbox_1.4.0_darwin_arm64.zip"
    sha256 "9e69202f22291882a6361593ab5a9fb38a2117d410fd7e11661d13baf101096f"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.0/darkbox_1.4.0_linux_arm64.tar.gz"
      sha256 "946267bb8898858bb2de1add989b8acbf303cd305e3a4f31c2d2339bb412be5d"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.4.0/darkbox_1.4.0_linux_amd64.tar.gz"
      sha256 "1b81171eff7d85761f97c5b95fd7ec03f2a250f104182d11c77a2bfdab9be0c2"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
