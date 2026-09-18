class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.3/ggw_0.3.3_darwin_arm64.zip"
      sha256 "02c67f5c9d4fc2301729e0a11d1790d1a2ed47b74420ab6b2f4e736c50905b7e"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.3/ggw_0.3.3_darwin_amd64.zip"
      sha256 "cfc4fe7aecc46159d6b41ce16dde6d51b2517ff57b2d9e1fd789b1af05a77382"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.3/ggw_0.3.3_linux_arm64.tar.gz"
      sha256 "20b57b03fa2a3c79412ca1c7ee7f2e57c39ecb223e45f7147eac4ebc41537b73"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.3/ggw_0.3.3_linux_amd64.tar.gz"
      sha256 "ab3e6e1bbae60f9d2ade7f37cae2eac1d77aa1ed317803168627f5a86e0172fd"
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
