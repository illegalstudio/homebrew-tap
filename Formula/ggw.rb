class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.1/ggw_0.3.1_darwin_arm64.zip"
      sha256 "e0f54eec3bb943bef1dfd635dcf9f907caad3839bebc2b61fbc81dfd531f09a1"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.1/ggw_0.3.1_darwin_amd64.zip"
      sha256 "37c31dbfb6fab78d4801cf314de7d99ccbab1cd6715ee562ea3cb83c6767fdf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.1/ggw_0.3.1_linux_arm64.tar.gz"
      sha256 "687bdcc8940842cf2b5f0be559f2a7bc7f7132e7ee8001741fc9e3ab82ea5a90"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.1/ggw_0.3.1_linux_amd64.tar.gz"
      sha256 "8a7414e8d95387da0308962c6e5c7f41a67eccb5b4860f7c6c80a5198d30c3b2"
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
