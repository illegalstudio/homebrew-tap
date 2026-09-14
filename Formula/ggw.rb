class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.2/ggw_0.3.2_darwin_arm64.zip"
      sha256 "0e7c2719c69183f8974060c31b0bcdff9e72a17b1d7a6d5c23166ba3cbf85cbc"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.2/ggw_0.3.2_darwin_amd64.zip"
      sha256 "5dce1ee93b1f8def0cf92a5136a8bde15e55b75bd7203faf2491b1f8de90391a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.2/ggw_0.3.2_linux_arm64.tar.gz"
      sha256 "28c981035ae10b079ef9ed5b28b50d1781e81de5e118301105194e15449570d8"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.3.2/ggw_0.3.2_linux_amd64.tar.gz"
      sha256 "cd08557804471e9112a0515d2f19a2db6e917280189e608a225dba31f166527f"
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
