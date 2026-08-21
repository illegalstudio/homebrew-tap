class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_darwin_arm64.zip"
      sha256 "b84ff277151c40eb3d4822b273a036948caca58477e6067f0cf6d057526af692"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_darwin_amd64.zip"
      sha256 "c430637b0484647b2bbfc7d2f6753336d1e089fb2877a734b1518ca57b5b558e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_linux_arm64.tar.gz"
      sha256 "187d0269eb6798c3ae7990e86fae9dabc38942feae66750bcc9b1ada1b44950b"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.0/ggw_0.3.0_linux_amd64.tar.gz"
      sha256 "a4c6b031ff4d5f22e0bbd3cdd51f83c89d65b6bcefefe337f026fbed8569ba35"
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
