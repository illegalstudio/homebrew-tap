class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.0/ggw_0.2.0_darwin_arm64.zip"
      sha256 "c509f3af4e958641921961bdaeb2645c9d3a1f34340eb8578f3d74aeec43fb42"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.0/ggw_0.2.0_darwin_amd64.zip"
      sha256 "13ba353f65fc05d42c38fbc1438c996a66a2ac210da1d9487a3dda526bf98065"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.0/ggw_0.2.0_linux_arm64.tar.gz"
      sha256 "99bfc2f3b520bc2a5b762df5e8c2e97e31da36cee45d27022f158681f654ddf1"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.2.0/ggw_0.2.0_linux_amd64.tar.gz"
      sha256 "9513eccc29f7c630640a0033b626b0c68e33bf568041dbcf9ca06482bc3600d6"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
