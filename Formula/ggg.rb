class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.1/ggg_0.2.1_darwin_arm64.zip"
      sha256 "e952d618f4b6ca7cbec26285720b9a1078f8bb45dccd25f926936e968416a895"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.1/ggg_0.2.1_darwin_amd64.zip"
      sha256 "a249244d0e9dc2cec80be9fcde4b78e032b2fd311f83c16a12bbdbfd568d8ec6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.1/ggg_0.2.1_linux_arm64.tar.gz"
      sha256 "f0ccbd46f35f074382cb762960c11685d0366e99223e0b0410f66eac9e241de4"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.1/ggg_0.2.1_linux_amd64.tar.gz"
      sha256 "9b87022f1121ab89080e1a278a92a3bf4b9d114b4f82e8a31da52c9f8a6fef4a"
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
