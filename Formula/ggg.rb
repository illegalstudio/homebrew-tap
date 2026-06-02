class Ggg < Formula
  desc "Clone and manage git repositories from a YAML configuration file"
  homepage "https://github.com/illegalstudio/ggg"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.3/ggg_0.1.3_darwin_arm64.zip"
      sha256 "90a0224a851d7e48730fd6c011b6d0c83fb27cbf0e36c82bd0951f29b66ed23c"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.3/ggg_0.1.3_darwin_amd64.zip"
      sha256 "396a18f4ce6168e9db5098383cb5c3967fecf6d44628072a9fea09d2014dc395"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.3/ggg_0.1.3_linux_arm64.tar.gz"
      sha256 "55bc3649328999915b3f4f5d26ccbcd20de9a5e0f4881d8eb213643c647ac8a2"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggg/releases/download/v0.1.3/ggg_0.1.3_linux_amd64.tar.gz"
      sha256 "09c8d2d44c3be8243f428f75705c5f70a7052c69288f24d9ecd3a2cac0431c27"
    end
  end

  def install
    bin.install "ggg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggg --version")
  end
end
