class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.5/ggw_0.1.5_darwin_arm64.zip"
      sha256 "9c77efdde096debc29d338837ab5050ac154769e1e648cb69fe4f06ddc7a5f79"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.5/ggw_0.1.5_darwin_amd64.zip"
      sha256 "01b26ac468a6a4f3450cc1b65316813e0bf562b0657b91499e1a1774a7d9ca7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.5/ggw_0.1.5_linux_arm64.tar.gz"
      sha256 "4adc3563c81ceb30e1fbc43a2e48047529a6bbf13e2ed9e0e1a81c570745f479"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.5/ggw_0.1.5_linux_amd64.tar.gz"
      sha256 "8531328a47ec49681849e354e805697962e18e625f0e5dc2ea2af9f03bbae608"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
