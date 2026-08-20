class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.0/ggg_0.2.0_darwin_arm64.zip"
      sha256 "798c19e272d44674d6898a46dadee55e6001eff9b68486b8cb04e7450c82174d"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.0/ggg_0.2.0_darwin_amd64.zip"
      sha256 "312fb1118b8bd6801f62574ee3ebf059c03ffb7f6ac736b07616697956bdbcb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.0/ggg_0.2.0_linux_arm64.tar.gz"
      sha256 "29a71de737c6f8233841c73df99009f7870252c728dc507e09b6fef921272de5"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.0/ggg_0.2.0_linux_amd64.tar.gz"
      sha256 "1355e7f607145c017286bbf12ceb7d40332a94c5c145676ba028cdcdb5dc7fc6"
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
