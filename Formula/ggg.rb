class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.4/ggg_0.1.4_darwin_arm64.zip"
      sha256 "7022b6883087012a5b76fabbd0ab98f08d52c809a9fcbbde2f66fb52ef887b4c"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.4/ggg_0.1.4_darwin_amd64.zip"
      sha256 "e748fc31365e8f6b0aac8f7050f330d66d7f1b85d409d4a911c69cd37f0dd119"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.4/ggg_0.1.4_linux_arm64.tar.gz"
      sha256 "b1b6465d69149e2c317b66c4ac46c5d75323c6d9beb8a451335bb84fbe8b299b"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.4/ggg_0.1.4_linux_amd64.tar.gz"
      sha256 "e91ce46d1c1239fc25473b813a4ef2d2fb0816e1215e4232f5f6a4cd1471b8cd"
    end
  end

  def install
    bin.install "ggg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggg --version")
  end
end
