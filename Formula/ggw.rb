class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.4/ggw_0.3.4_darwin_arm64.zip"
      sha256 "f8b33ecee4d408f023a3ed9364044b007163d54ea6b1cfa16d45bb6809e35805"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.4/ggw_0.3.4_darwin_amd64.zip"
      sha256 "ee152124e66d30a36e397bcb7bfa2c7b754bf02261975274326e4f872410d708"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.4/ggw_0.3.4_linux_arm64.tar.gz"
      sha256 "9d233d1070fde075ca7ccfe7d6d359d4bd4d9e6ae7d6c38e644b2393373562f2"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.4/ggw_0.3.4_linux_amd64.tar.gz"
      sha256 "4d8ba96b6c50d5e95387e3a2852dbb9597267dc15000e425f82f5c9f38b362c3"
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
