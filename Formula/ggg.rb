class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.6/ggg_0.1.6_darwin_arm64.zip"
      sha256 "d08a9ccaf01d3cbcab0efef2b6f7cf55edbb9de2244f6802431091d67762dbb9"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.6/ggg_0.1.6_darwin_amd64.zip"
      sha256 "d14623133ecb2d76d20721cdd32f3600af17c8ccf6d1aa976d629ec06e491a83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.6/ggg_0.1.6_linux_arm64.tar.gz"
      sha256 "3594e6379f3eb4122e0e47fe593a853a8edd80d5e4f541f3ab255c84331e0e8b"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.6/ggg_0.1.6_linux_amd64.tar.gz"
      sha256 "350ada2f225480f11c8f41246639f58f029494ff5b7490c0bd4e0553d913cf3f"
    end
  end

  def install
    bin.install "ggg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggg --version")
  end
end
