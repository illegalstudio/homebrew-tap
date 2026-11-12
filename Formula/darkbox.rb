class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.6.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.1/darkbox_1.6.1_darwin_arm64.zip"
    sha256 "23a1df96307cf46b8ee8568643d0f4c27f95e385c6f183a47832d880002f2e42"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.1/darkbox_1.6.1_linux_arm64.tar.gz"
      sha256 "126bedb5014bd3bd40c0e8130dccaecb261c71fb7b4b58f179e2a4fd294c9232"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.6.1/darkbox_1.6.1_linux_amd64.tar.gz"
      sha256 "d9a176d06cb6424ddee9da165eb698eb5d4fe19d1c74fff5da55d37b456c9903"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.6.1", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
