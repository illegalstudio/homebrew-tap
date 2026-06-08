class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.5/ggg_0.1.5_darwin_arm64.zip"
      sha256 "24dfac0832af156bf7a431c77be20d54a97ef7a782aafa60642cbeec8106969e"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.5/ggg_0.1.5_darwin_amd64.zip"
      sha256 "278e26429dc7717583f4a2e47affff97eb35b44f67ad44ae56c7e045e23b6c9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.5/ggg_0.1.5_linux_arm64.tar.gz"
      sha256 "a7a75019b358649e952d7103d67db16a08ee42abae2a3cabdd76b37ad3ce3aef"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.5/ggg_0.1.5_linux_amd64.tar.gz"
      sha256 "d50b78bf82c247b4de82a8ba53c47fa37bb8049398ebc42c64714f2d004f1509"
    end
  end

  def install
    bin.install "ggg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggg --version")
  end
end
