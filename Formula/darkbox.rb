class Darkbox < Formula
  desc "Offline inspection and verification of Darkbox project archives"
  homepage "https://illegal.studio/en/products/darkbox"
  version "1.3.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/illegalstudio/darkbox/releases/download/v1.3.1/darkbox_1.3.1_darwin_arm64.zip"
    sha256 "38d21c8663cb93c368c8510d7e74eb65451e8d9a2d7fe6dfd280eaee3eba4f06"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.3.1/darkbox_1.3.1_linux_arm64.tar.gz"
      sha256 "a8c8af440be027b4f6c0eed547272a0d0b82e98bbcc9a3927df2868c5addee55"
    end
    on_intel do
      url "https://github.com/illegalstudio/darkbox/releases/download/v1.3.1/darkbox_1.3.1_linux_amd64.tar.gz"
      sha256 "1151788cfcf4c2b038027b049329b7cbcf48943a2662a2e9c2b8f99c2d9cb1dd"
    end
  end

  def install
    bin.install "darkbox"
    pkgshare.install "LICENSE", "CLI.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "1.3.1", shell_output("#{bin}/darkbox --version")
    assert_match "verify", shell_output("#{bin}/darkbox --help")
    assert_match "darkbox", shell_output("#{bin}/darkbox versions --json")
  end
end
