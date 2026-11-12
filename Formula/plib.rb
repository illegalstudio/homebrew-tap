class Plib < Formula
  desc "Save and reuse notes with Project Library"
  homepage "https://github.com/illegalstudio/project-library"
  version "0.1.4"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/project-library/releases/download/v0.1.4/plib_0.1.4_darwin_arm64.zip"
      sha256 "2d6198fc089e259c5a50d70df4ff8d885d7830e14eb8c1b05d8baf19d0997faf"
    end
    on_intel do
      url "https://github.com/illegalstudio/project-library/releases/download/v0.1.4/plib_0.1.4_darwin_amd64.zip"
      sha256 "b05b956ae629afa953839e4e72d0d209e8ab60ced28b7cb0208c8097c290ebc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/project-library/releases/download/v0.1.4/plib_0.1.4_linux_arm64.tar.gz"
      sha256 "b3e56a2b1e3f9d434836d256a045a029bae352de868455497ff2080611be153e"
    end
    on_intel do
      url "https://github.com/illegalstudio/project-library/releases/download/v0.1.4/plib_0.1.4_linux_amd64.tar.gz"
      sha256 "3a50cf6451433c8e09b59a7855c20c86217c7d4c0ce9e0c9a0417ccf310d82c1"
    end
  end

  def install
    bin.install "plib"
  end

  def caveats
    "Install the bundled AI agent skill with: plib skills install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plib --version")
    assert_match "Project Library", shell_output("#{bin}/plib --help")
    assert_match "skills", shell_output("#{bin}/plib --help")
  end
end
