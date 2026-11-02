class Plib < Formula
  desc "A prompt library for your terminal"
  homepage "https://github.com/illegalstudio/prompt-library"
  version "0.1.2"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.2/plib_0.1.2_darwin_arm64.zip"
      sha256 "b2d0a6c6f4f92df9b1c403466eed185532d5c12ecf69f7710f76881ff719f8a6"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.2/plib_0.1.2_darwin_amd64.zip"
      sha256 "8b314c45df24248cceb025f922c9f46c6a8bf44028a8194d7a37ee361b5b42f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.2/plib_0.1.2_linux_arm64.tar.gz"
      sha256 "3661ed8903caa0429dc09b290ac9437cabf02ef464a07d7170df77be8b608ab2"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.2/plib_0.1.2_linux_amd64.tar.gz"
      sha256 "e89167f18e93d2d5993b50a744608b95dd26fb59f7d98b643172319d34da840d"
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
    assert_match "prompt library", shell_output("#{bin}/plib --help")
    assert_match "skills", shell_output("#{bin}/plib --help")
  end
end
