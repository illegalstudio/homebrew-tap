class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.7/ggw_0.1.7_darwin_arm64.zip"
      sha256 "56fe99c9b0c59d007605cfe294aca76c2a4eed3212e9c7a6624ca709292d9f92"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.7/ggw_0.1.7_darwin_amd64.zip"
      sha256 "08f1aab7631b208ab8ec8d2a51968ac3c5d292d3018b32d719d8b9abdf793e26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.7/ggw_0.1.7_linux_arm64.tar.gz"
      sha256 "7e378f5882f39be1d5ccbb4790e41b8c0298ddaabd34e53b2010d2890edb52fa"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.7/ggw_0.1.7_linux_amd64.tar.gz"
      sha256 "21d6f38826ef92fafb889fc3cd35dac5481a001692d2b41206a19fce8497e101"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
