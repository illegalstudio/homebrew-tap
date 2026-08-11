class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.1/ggw_0.2.1_darwin_arm64.zip"
      sha256 "8b2a8dfafd00dd3d301fe1cf923311ddb7675c1e929b1c5579faff7eab172050"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.1/ggw_0.2.1_darwin_amd64.zip"
      sha256 "69514c6c6de1622e39e778605029ba94e0b592c133e653fc584083ffb2444f1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.1/ggw_0.2.1_linux_arm64.tar.gz"
      sha256 "443878839858d651cda5723391ef9156146f0279af0991f7fce224694b72caf0"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.1/ggw_0.2.1_linux_amd64.tar.gz"
      sha256 "e9cabea090573e35aa07a321fb055ef73924bf3f5dece291a0b0c6fa4d5b4f83"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
