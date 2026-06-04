class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.4/ggw_0.1.4_darwin_arm64.zip"
      sha256 "d046bae752a92da30f675ed776f94e7d7426a5ab77c1648fe99a23d14614d53e"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.4/ggw_0.1.4_darwin_amd64.zip"
      sha256 "c893ea6c085a785f530a2b5ce580a1efe6493012f7a3d7081f74714c2b8a50f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.4/ggw_0.1.4_linux_arm64.tar.gz"
      sha256 "20d957b00507c8b1ad9d789418f87f7da20d15dfdcadee67c1e179dbe6eb5f72"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.4/ggw_0.1.4_linux_amd64.tar.gz"
      sha256 "5f48c8cf4e434890c8ca5e34437fdc7be7ca7c1bbd7762b5f98141e9f14892a8"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
