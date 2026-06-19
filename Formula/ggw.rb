class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.8/ggw_0.1.8_darwin_arm64.zip"
      sha256 "2be370beb748bc74c3bcbee3ab735d4745407745531b269c0e926c8dbfc527e1"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.8/ggw_0.1.8_darwin_amd64.zip"
      sha256 "3d160ac677d694a28fced2930d634a375a2e91f10b09694893d8247e316637db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.8/ggw_0.1.8_linux_arm64.tar.gz"
      sha256 "4b8c725c96729e4f850d8238968add2b0c1123ccdbe5c24aa430f59b76c86e86"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.8/ggw_0.1.8_linux_amd64.tar.gz"
      sha256 "664ebfeec47684528e60222561bfdcaa410f27691788e286a052952453f44dd6"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
