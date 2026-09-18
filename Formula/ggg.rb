class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.2/ggg_0.2.2_darwin_arm64.zip"
      sha256 "7ff882e994da0392c2573df2199a89cffc52392464ea161f2052c4e0c948b14d"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.2/ggg_0.2.2_darwin_amd64.zip"
      sha256 "a2695d2b9ca2ad96ec71cc8154c927235450d15ee7dd275211d13744f44a0803"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.2/ggg_0.2.2_linux_arm64.tar.gz"
      sha256 "63a4b3f7614ebec8b4b46a596fe125e4fb76be363febebc819584058e827f19e"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.2/ggg_0.2.2_linux_amd64.tar.gz"
      sha256 "7784d56c6159923bfabba36349312168584b25bc78ec844534e81fcca9a10907"
    end
  end

  def install
    bin.install "ggg"
  end

  def caveats
    <<~EOS
      Install the bundled GGG skill for AI agents with:
        ggg skills install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggg --version")
    assert_match "skills", shell_output("#{bin}/ggg --help")
  end
end
