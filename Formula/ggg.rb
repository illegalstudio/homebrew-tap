class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.3/ggg_0.2.3_darwin_arm64.zip"
      sha256 "ede3812492222cf81d1418ffcbd13e106be95037842e09f7b618293563d19340"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.3/ggg_0.2.3_darwin_amd64.zip"
      sha256 "4dac61a5acf833d2fba1a212a706f3189a4af5802c0ee02b0a929a6fcad71368"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.3/ggg_0.2.3_linux_arm64.tar.gz"
      sha256 "bd888c479fff4ca92d69f9771c96bf64eb02e11e3303ce86e349bf1b834c8d4c"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.2.3/ggg_0.2.3_linux_amd64.tar.gz"
      sha256 "df1ef134fc32c0e37e9fb36f77106c81c63b6e288f04cbfa6ddfc9c324bf08d4"
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
