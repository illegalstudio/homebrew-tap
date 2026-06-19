class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.6/ggw_0.1.6_darwin_arm64.zip"
      sha256 "d53138e201d2906f8690b78791b30b5503b3ba4fab0ca884146a093f3525aaad"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.6/ggw_0.1.6_darwin_amd64.zip"
      sha256 "45c6d778651311137f154164cf081a63f542b72d1a48aaca4d5a60b9339e38e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.6/ggw_0.1.6_linux_arm64.tar.gz"
      sha256 "bff7776bdd2046a944627ba0df4a6b0d2d7ee53a280414fc781d6ac11796fd3d"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.6/ggw_0.1.6_linux_amd64.tar.gz"
      sha256 "cb149c03238c3b7e37524e4429b79225271fedadbc347c4ca95fac119b4ffc14"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
