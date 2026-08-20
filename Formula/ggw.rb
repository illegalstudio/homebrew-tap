class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_darwin_arm64.zip"
      sha256 "3d3c4f4fc6f0fe9a465f20d2fffb358aca30c57d17ab38294856dd55fb50c55a"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_darwin_amd64.zip"
      sha256 "c1a19f6f1ec1957901aadf0eea8e347d2c7b4739b9a494ac68dded95f7508d84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_linux_arm64.tar.gz"
      sha256 "55b5913d2d858f540848f33604ce08ff5e02261562a4143aa8ca6a2d5a3b0b75"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_linux_amd64.tar.gz"
      sha256 "02e8e93d7aa8a54956ca0758aa4e4d859e684e7fe3124178639ac38a3fba5227"
    end
  end

  def install
    bin.install "ggw"
  end

  def caveats
    <<~EOS
      Install the bundled GGW skill for AI agents with:
        ggw skills install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
    assert_match "skills", shell_output("#{bin}/ggw --help")
  end
end
